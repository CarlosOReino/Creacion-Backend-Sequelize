import { DataTypes } from 'sequelize';
import {conn} from '../databases/mysql.js';

const sequelize = conn();
const User = sequelize.define('User', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    firstname: {
      type: DataTypes.STRING,
      allowNull: false
    },
    lastname: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    tableName: 'users'
  });

  export async function connectToDatabase() {
    try {
      await sequelize.authenticate();
      console.log('Conexión establecida correctamente.');
      await User.sync(); // Esto crea la tabla si no existe
      console.log('Modelo User sincronizado con la base de datos.');
    } catch (error) {
      console.error('No se pudo conectar a la base de datos:', error);
    }
  }

// Create
export async function createUser(firstname, lastname) {
  try {
    const newUser = await User.create({ firstname, lastname });
    console.log('Usuario creado:', newUser.toJSON());
    return newUser;
  } catch (error) {
    console.error('Error al crear usuario:', error);
  }
}

// Read (all users)
export async function getAllUsers() {
  try {
    const users = await User.findAll();
    console.log('Todos los usuarios:', JSON.stringify(users, null, 2));
    return users;
  } catch (error) {
    console.error('Error al obtener usuarios:', error);
  }
}

// Read (single user)
export async function getUserById(id) {
  try {
    const user = await User.findByPk(id);
    if (user) {
      console.log('Usuario encontrado:', user.toJSON());
      return user;
    } else {
      console.log('Usuario no encontrado');
    }
  } catch (error) {
    console.error('Error al buscar usuario:', error);
  }
}

// Update
export async function updateUser(id, newData) {
  try {
    const user = await User.findByPk(id);
    if (user) {
      await user.update(newData);
      console.log('Usuario actualizado:', user.toJSON());
      return user;
    } else {
      console.log('Usuario no encontrado');
    }
  } catch (error) {
    console.error('Error al actualizar usuario:', error);
  }
}

// Delete
export async function deleteUser(id) {
  try {
    const user = await User.findByPk(id);
    if (user) {
      await user.destroy();
      console.log('Usuario eliminado');
      return true;
    } else {
      console.log('Usuario no encontrado');
      return false;
    }
  } catch (error) {
    console.error('Error al eliminar usuario:', error);
  }
}
