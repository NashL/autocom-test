import React from 'react';
import Loader from 'react-loader-spinner';

function Spinner() {
  
  return (
    <div className="row align-items-center mt-5">
      <div className="d-flex justify-content-center">
        <Loader type="TailSpin" color="#00BFFF" height={200} width={200} />
      </div>
    </div>
  )
}

export default Spinner;