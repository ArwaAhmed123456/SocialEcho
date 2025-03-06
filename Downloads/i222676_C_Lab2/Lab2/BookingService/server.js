
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

dotenv.config();
const app = express();
app.use(express.json());


const PORT = process.env.PORT || 8083;
const USER_URL = process.env.USER_URL;
const CAR_URL = process.env.CAR_URL;

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("MongoDB Connected"))
    .catch(err => console.log(err));


const BookingSchema = new mongoose.Schema({
    userId: String,
    carId: String,
    startDate: Date,
    endDate: Date,
    status: String,
});

const Booking = mongoose.model("Booking", BookingSchema);

//dummay data to check
const bookings = [
    { id: 1, userId: 2, carId: 1 , startDate: "2025-1-1", endDate: "2025-2-1" , status: "active"},
    { id: 2, userId: 1, carId: 2 , startDate: "2024-12-1", endDate: "2025-1-1" , status: "cancel"},
];


mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("Connected to MongoDB"))
    .catch(err => console.error("MongoDB Connection Error:", err));

//all booking details
app.get("/bookings", async (req, res) => {
    try {
        const bookings = await Booking.find({ Id: req.user.id }); 
        res.json(bookings);

    } catch (error) {
        res.status(500).json({ error: "Error fetching booking details" });
    }
});


app.post("/bookings", async (req, res) => {
    const { carId, isAvailable } = req.body;
    const { userId, Booking , maxBooking } = req.user.id; 

    try {

        const userData = await axios.get(`${USER_URL}/${userId}`);
        if (!userData.data) return res.status(404).json({ error: "User not found" });

        const carData = await axios.get(`${CAR_URL}/${carId}`);
        if (!carData.data) return res.status(404).json({ error: "Car not found" });

        //check user limit
        if (userId.Booking == userId.maxBooking ){

            res.json({ message: "Already reached max limit!"});   
        
        } else {

              const newBooking = new Booking({ userId, carId, startDate, endDate, status });
              await newBooking.save();

        res.status(201).json({ message: "Booking done successfully!", booking: newBooking });
        }

    } catch (error) {
        console.error("Order Error:", error.message);
        res.status(500).json({ error: "Error processing booking" });
    }
});


//Booking Service -> User Service

//checking max limit
app.get("/bookings/:id", async (req, res) => {
    try {
        const booking = await Booking.findById(req.params.id);
        if (!booking) return res.status(404).json({ error: "Booking not found" });

        
        const carData = await axios.get(`${CAR_URL}/${carId}`);
        if (!carData.data) return res.status(404).json({ error: "Car not found" });

        //check user limit
        if (userId.Booking == userId.maxBooking ){

            res.json({ message: "Already reached max limit!"});   
        
        } 

    } catch (error) {
        res.status(500).json({ error: "Error retrieving booking" });
    }
});

//after booking done
app.put("/bookings/:id", async (req, res) => {
    try {
        //const { status } = req.body;
        const booking = await Booking.findById(req.params.id);

        if (!booking) return res.status(404).json({ error: "Booking not found" });

        const userData = await axios.get(`${USER_URL}/${userId}`);
        if (!userData.data) return res.status(404).json({ error: "User not found" });

        userData.Booking ++;
        await userData.save();

        res.json({ message: "Booking updated", order });

    } catch (error) {
        res.status(500).json({ error: "Error updating booking" });
    }
});

//canceling booking
app.delete("/bookings/:id", async (req, res) => {
    try {
        const booking = await Booking.findById(req.params.id);

        if (!booking) return res.status(404).json({ error: "Booking not found" });

        const userData = await axios.get(`${USER_URL}/${userId}`);
        if (!userData.data) return res.status(404).json({ error: "User not found" });

        userData.Booking--;
        await userData.delete();

        res.json({ message: "Booking cancelled successfully", order });

    } catch (error) {
        res.status(500).json({ error: "Error canceling booking" });
    }
});



//Booking Service -> Car Service

//Car Availability
app.get("/bookings/:id", async (req, res) => {
    try {
        const booking = await Booking.findById(req.params.id);
        if (!booking) return res.status(404).json({ error: "Booking not found" });

        
        const carData = await axios.get(`${CAR_URL}/${carId}`);
        if (!carData.data) return res.status(404).json({ error: "Car not found" });

        //check user limit
        if (carData.isAvailable == 1){

            res.json({ message: "Car is not availble!"});   
        
        } else {

            res.json({ message: "Available"});
        }

    } catch (error) {
        res.status(500).json({ error: "Error retrieving booking data" });
    }
});

//after booking done
//car unavailable
app.put("/bookings/:id", async (req, res) => {
    try {

        const booking = await Booking.findById(req.params.id);

        if (!booking) return res.status(404).json({ error: "Booking not found" });

        const carData = await axios.get(`${CAR_URL}/${carId}`);
        if (!carData.data) return res.status(404).json({ error: "Car not found" });

        if (booking){

            carData.isAvailable == 0;
             
            await carData.save();

            res.json({ message: "Car Availability updated", order });
        }
       

    } catch (error) {
        res.status(500).json({ error: "Error updating booking" });
    }
});

//canceling booking
app.delete("/bookings/:id", async (req, res) => {
    try {
        const booking = await Booking.findById(req.params.id);

        if (!booking) return res.status(404).json({ error: "Booking not found" });
      
        const carData = await axios.get(`${CAR_URL}/${carId}`);
        if (!carData.data) return res.status(404).json({ error: "Car not found" });

        carData.isAvailable = 1;
        await carData.save();

        res.json({ message: "Booking cancelled successfully", order });

    } catch (error) {
        res.status(500).json({ error: "Error canceling booking" });
    }
});


app.listen(PORT, () => console.log(`Booking Service running on port ${PORT}`));
