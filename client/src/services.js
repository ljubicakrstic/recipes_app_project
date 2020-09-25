import axios from 'axios';

const getAllRecipes = () => {
    return axios.get('http://localhost:5000/recipes');
}

const getIngredients = () => {
    return axios.get('http://localhost:5000/ingredients');
}

const getRecipeTypes = () => {
    return axios.get('http://localhost:5000/types');
}

const getMealGroups = () => {
    return axios.get('http://localhost:5000/meals');
}

const getRecipeById = (id) => {
    return axios.get(`http://localhost:5000/recipe/?id=${id}`);
}

const getRecipesByMeals = (meal) => {
    return axios.get(`http://localhost:5000/recipesByMeal/?meal=${meal}`);
}

const getRecipesByTypes = (type) => {
    return axios.get(`http://localhost:5000/recipesByType/?type=${type}`);
}

const getIngredientsByRecipeId = (id) => {
    return axios.get(`http://localhost:5000/recipeIngredients/?id=${id}`);
}

const getTypesByRecipeId = (id) => {
    return axios.get(`http://localhost:5000/recipeTypes/?id=${id}`);
}

const getMealGroupsByRecipeId = (id) => {
    return axios.get(`http://localhost:5000/recipeMeals/?id=${id}`);
}

const postRecipe = (recipe) => {
    return axios.post('http://localhost:5000/recipes', recipe);
}

const postRecipeTypes = (type, id) => {
    let info = {id_recept: id, id_tip: type};
    return axios.post('http://localhost:5000/types', info);
}

const postRecipeMelas = (meal, id) => {
    let info = {id_recept: id, id_grupa: meal};
    return axios.post('http://localhost:5000/meals', info);
}

const postRecipeIngredients = (ingredient, id, amount) => {
    let info = {id_recept: id, id_sastojak: ingredient, kolicina: amount};
    return axios.post('http://localhost:5000/ingredients', info);
}

const postRecipeImage = (formData) => {
    return axios.post('http://localhost:5000/upload', formData);
}

const addImageToRecipe = (id, image) => {
    let info = {id_recept: id, slika: image};
    return axios.post('http://localhost:5000/addImage', info);
}

const findUser = (username, password) => {
    let info = {username, password};
    return axios.post('http://localhost:5000/login', info);
}

const findUserById = (id) => {
    return axios.get(`http://localhost:5000/user/?id=${id}`);
}

const registerUser = (username, name, email, password) => {
    let info = {korisnicko_ime: username, ime_prezime: name, email: email, sifra: password};
    return axios.post('http://localhost:5000/registerUser', info);
}



export { getIngredients, getRecipeTypes, getMealGroups, postRecipe, postRecipeTypes, postRecipeMelas, postRecipeIngredients, postRecipeImage, addImageToRecipe, getRecipeById, getIngredientsByRecipeId, getTypesByRecipeId, getMealGroupsByRecipeId, getAllRecipes, findUser, registerUser, findUserById, getRecipesByMeals, getRecipesByTypes };