// login

  const getMoviesFromApi = (params) => {
  console.log(params.genre);
  // CAMBIA ESTE FETCH PARA QUE APUNTE A UN ENDPOINT DE TU SERVIDOR, PIENSA SI DEBE SER GET O POST, PIENSA QUÉ DATOS DEBES ENVIAR, ETC
  return fetch(`http://localhost:4000/api/movies?genre=${params.genre}`)
    .then(response => response.json())
    .then(data => {
      console.log(data);
      // CAMBIA EL CONTENIDO DE ESTE THEN PARA GESTIONAR LA RESPUESTA DEL SERVIDOR Y RETORNAR AL COMPONENTE APP LO QUE NECESITA
      return data; 

    });
}; 

/* const getMoviesFromApi = (params) => {
  const queryParams = new URLSearchParams();

  if (params.genre) {
    queryParams.append("genre", params.genre);
  }

  return fetch(`http://localhost:4000/api/movies?${queryParams.toString()}`)
    .then(response => response.json())
    .then(data => {
      return data;
    });
}; */


const objToExport = {
  getMoviesFromApi: getMoviesFromApi
};

export default objToExport;
