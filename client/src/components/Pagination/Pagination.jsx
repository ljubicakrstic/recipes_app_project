import React, { useEffect, useState } from 'react';

const Pagination = ({start, setStart, recipes}) => {

    const [disabledOlder, setDisabledOlder] = useState('');
    const [disabledNewer, setDisabledNewer] = useState('');

    useEffect(() => {
        if(start === 0){
            setDisabledNewer('disabled');
        }else if(start > recipes.length - 4){
            setDisabledOlder('disabled');
        }else{
            setDisabledNewer('');
            setDisabledOlder('');
        }
    }, [start]);


    return (
        <ul className="pagination justify-content-center mb-4">
                <li className={`page-item ${disabledOlder}`}>
                  <button className="page-link" onClick={() => setStart(start + 3)} >&larr; Starije</button>
                </li>
                <li className={`page-item ${disabledNewer}`}>
                  <button className="page-link" onClick={() => setStart(start - 3)} >Novije &rarr;</button>
                </li>
              </ul>
    )
}

export default Pagination;