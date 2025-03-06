
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

dotenv.config();
const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("MongoDB Connected"))
    .catch(err => console.log(err));


const UserSchema = new mongoose.Schema({
    name: String,
    email: String,
    Booking: Number,
    maxBooking: {type:Number, default: 3},
});

const User = mongoose.model("User", UserSchema);

//dummay data to check
const users = [
    { id: 1, name: "Shurahbeel", email: "shurahbeel@gamil.com" , Booking: 2},
    { id: 2, name: "Miracle", email: "miracle@gamil.com", Booking: 1 }
];


app.get("/users", (req, res) => {
    res.json(users);
});

app.post("/users", async (req, res) => {
    const { name, email, Booking} = req.body;

    const user = new User({ name, email, Booking });

    await user.save();
    res.send(user);
});

app.get("/users/:id", async (req, res) => {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).send("User not found");
    res.send(user);
});

// Start server
const PORT = process.env.PORT || 8082;
app.listen(PORT, () => console.log(`User Service running on port ${PORT}`));
