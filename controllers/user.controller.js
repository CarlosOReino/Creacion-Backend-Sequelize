import { connectToDatabase, createUser } from "../models/user.model.js";


export async function conn(){
    await connectToDatabase();
    console.log("Conexión establecida correctamente.");
}


export async function createNewUser(req, res) {
    await createUser(req.body.firstname, req.body.lastname);
    res.json("Usuario creado correctamente.");
}