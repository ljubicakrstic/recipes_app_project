import React from 'react';
import { useEffect } from 'react';
import { useState } from 'react';
import { v1 as uuidv1 } from 'uuid';
import './Search.css'; 

const Search = ({ingredients, amount, setAmount, selectedIngredients, setSelectedIngredients}) => {

    const [filter, setFilter] = useState('');
    const [filteredOptions, setFilteredOptions] = useState([]);
    const [text, setText] = useState('');
    const [chosen, setChosen] = useState('');
    const [disabled, setDisabled] = useState(false);
    const [deleteBtn, setDeleteBtn] = useState('hide');

    let filtered = ingredients.filter(ingredient => ingredient.naziv.toLowerCase().includes(filter.toLowerCase()));

    useEffect(() => {
        filter !== '' ?
        setFilteredOptions(filtered)
        :
        setFilteredOptions([])
    }, [filter]);

    const handleClick = (e) => {
        console.log(e.target.value);
        setText(e.target.innerText);
        setFilter('');
        let tmp = [...selectedIngredients];
        let newEntry = {id: uuidv1(), amount: amount, ingredient: e.target.value};
        tmp.push(newEntry);
        setChosen(e.target.value);
        console.log(tmp);
        setSelectedIngredients(tmp);
        setDisabled(true);
        setDeleteBtn('show');
    }

    const deleteEntry = () => {
        let tmp = [...selectedIngredients];
        tmp.splice(tmp.findIndex(el => el.ingredient === chosen), 1);
        console.log(chosen);
        setSelectedIngredients(tmp);
    }

    return (
        <>
        <div className='form-row'>
            
            <div className='col'>
                <input type='text' placeholder='Kolicina, npr. 300 gr' onChange={(e) => setAmount(e.target.value)} className='form-control' disabled={disabled}/>
            </div>
            <div className='col'>
                <input type='text' onChange={(e) => {setFilter(e.target.value); setText(e.target.value)}} value={text} className='form-control' placeholder='Sastojak, npr. Piletina' disabled={disabled}/>
            </div>
        </div>
         <div id='ingredients'>
         <ul className='search-results'>{filteredOptions.map(el => <li key={el.id} className='search-result-item'><button className='search-result-button' type='button' value={el.id} onClick={handleClick}>{el.naziv}</button></li>)}</ul>
        </div>
        <br/>
        </>
    )
}

export default Search;