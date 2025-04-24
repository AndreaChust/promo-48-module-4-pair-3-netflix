const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
// const bcrypt = require

// create and config server
const server = express();
server.use(cors());
server.use(express.json({ limit: "25mb" }));

async function getConnection() {
  const connection = await mysql.createConnection({
    host: 'localhost',
    database: 'pruebas',
    user: 'root',
    password: 'cucocuco',
  });
  await connection.connect();

  console.log(
    `Conexión establecida con la base de datos (identificador=${connection.threadId})`
  );

  return connection;
}

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

/*const fakeMovies = [
   {
    id: 1,
    title: "Wonder Woman",
    genre: "Action",
    image:
      "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/12/gal-gadot-como-wonder-woman-universo-extendido-dc-2895594.jpg?tf=3840x",
    category: "Superhero",
    year: 2017,
    director: "Patty Jenkins",
  },
  {
    id: 2,
    title: "Inception",
    genre: "Science Fiction",
    image:
      "https://m.media-amazon.com/images/S/pv-target-images/e826ebbcc692b4d19059d24125cf23699067ab621c979612fd0ca11ab42a65cb._SX1080_FMjpg_.jpg",
    category: "Thriller",
    year: 2010,
    director: "Christopher Nolan",
  }, 
]; */
// ENDPOINT

// LISTAR PELÍCULAS

/*  server.get("/api/movies", async (req, res) => {

  const connection = await getConnection();
  let query = "SELECT * FROM movies;";
  const filterGenre = req.query.genre;
  
  const [moviesResults] = await connection.query(query);
  console.log(req.query.genre);
connection.end();

    if (moviesResults.length === 0) {
      res.status(404).json({
        status: "error",
        message: "No se han encontrado resultados"
      })
    } else {
      res.status(200).json({
        success: true,
        movies: moviesResults
      });

    }

})  */

    server.get("/api/movies", async (req, res) => {
      const connection = await getConnection();
      const genreFilterParam = req.query.genre;
    
      let query = "SELECT * FROM movies";
      const queryParams = [];
    
      if (genreFilterParam && genreFilterParam !== "") {
        query += " WHERE genre = ?";
        queryParams.push(genreFilterParam);
      }
    
      try {
        const [moviesResults] = await connection.query(query, queryParams);
        connection.end();
    
        if (moviesResults.length === 0) {
          res.status(404).json({
            status: "error",
            message: "No se han encontrado resultados"
          });
        } else {
          res.status(200).json({
            success: true,
            movies: moviesResults
          });
        }
      } catch (error) {
        connection.end();
        res.status(500).json({
          status: "error",
          message: "Error al obtener las películas"
        });
      }
    });
    

