
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

dotenv.config();
const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("MongoDB Connected"))
    .catch(err => console.log(err));


const CarSchema = new mongoose.Schema({
    model: String,
    location: String,
    isAvailable: Boolean
});

const Car = mongoose.model("Car", CarSchema);

//dummay data to check
const cars = [
    { id: 1, model: "123ABC", location: "Islamabad" , isAvailable: "No"},
    { id: 2, name: "XYZ456", location: "karachi", isAvailable: "Yes" }
];


app.get("/cars", (req, res) => {
    res.json(cars);
});

app.post("/cars", async (req, res) => {
    const { model, location, isAvailable } = req.body;

    const car = new Car({ model, location, isAvailable });

    await car.save();
    res.send(car);
});

app.get("/cars/:id", async (req, res) => {
    const car = await Car.findById(req.params.id);
    if (!car) return res.status(404).send("Car not found");
    res.send(car);
});


app.put("/cars/:id", async (req, res) => {

        // const { isAvailable } = req.body;
        const car = await Car.findById(req.params.id);

        if (!car) return res.status(404).json({ error: "car not found" });

        if (car.isAvailable == "Yes"){

           res.json({ message: "Car is avaiable", car});

        } else {
            res.json({ message: "Car not avaiable", car});
           
        }
  
});

// Start server
const PORT = process.env.PORT || 8081;
app.listen(PORT, () => console.log(`Car Service running on port ${PORT}`));
