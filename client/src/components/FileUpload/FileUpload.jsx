import React from 'react';
import { useState } from 'react';
import {  addImageToRecipe, postRecipeImage } from '../../services';
import { useHistory, useParams } from 'react-router-dom';
import { v1 as uuidv1 } from 'uuid';

const FileUpload = () => {

    const idRecipe = useParams().id;
    const [file, setFile] = useState('');
    const [fileName, setFileName] = useState('Dodaj sliku');
    const history = useHistory();
    history.location.pathname = '/';

    const handleFileChange = (e) => {
        setFile(e.target.files[0]);
        setFileName(e.target.files[0].name);
    }

    const uploadImage = (e) => {

        e.preventDefault();
        const formData = new FormData();
        formData.append('file', file);
        formData.append('imageId', uuidv1());
        postRecipeImage(formData).then(res => {
            const {fileName, filePath} = res.data;
            addImageToRecipe(idRecipe, filePath).then(res => {
                console.log(res);
                history.push(`recipe/${idRecipe}`);
            })
            
        }).catch(err => {
            if(err.response.status === 500) {
                console.log('Server problem');
            }else{
                console.log(err.response.data.msg);
            }
        });
    }

    return (
        <>
        <div className='container-fluid'>
            <div className='row'>
                <div className='col-sm-8 offset-sm-2 mt-4'>
                    <form onSubmit={uploadImage}>
                        <div className="custom-file">
                            <input type="file" className="custom-file-input " id="validatedCustomFile" required onChange={handleFileChange}/>
                            <label className="custom-file-label" htmlFor="validatedCustomFile">
                                {fileName}
                            </label>
                        </div>
                        <button type='submit' className='btn btn-primary btn-block'>Upload</button>
                    </form>
                    <button className='btn btn-outline-success'>Preskoči</button>
                </div>
            </div>
        </div>
        
        </>
    )
}

export default FileUpload;