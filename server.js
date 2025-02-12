import express, {json} from "express";
import genericController from "./controllers/generic.controller.js";
import {conn,  createNewUser} from "./controllers/user.controller.js";


const app = express();
// para que express pueda entender los json y reciba los datos de una peticion post.
app.use(json());

app.get("/", conn)
app.post("/create-user", createNewUser);
app.listen(3000);
console.log("Server running on port 3000");