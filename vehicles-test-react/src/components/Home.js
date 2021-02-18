import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';
import Spinner from './Spinner';
import Filters from './Filters';
import VehicleList from './VehicleList';

function Home() {
  const [vehicles, setVehicles] = useState([]);
  const [type, setType] = useState('model');
  const [loading, setLoading] = useState(true);
  const [query, setQuery] = useState("")

  const getData = useCallback(async () => {
    let filter_name = ''
    switch (type) {
      case 'brand':
        filter_name = 'brand_name';
        break;
      case 'model':
        filter_name = 'model_name';
        break;
      case 'year':
        filter_name = 'greater_than_year';
        break;
      case 'mileage':
        filter_name = 'lower_than_mileage';
        break;
      case 'price':
        filter_name = 'lower_than_price';
        break;
    }
    const response = await axios.get(`http://localhost:3000/api/v1/vehicles?${filter_name}=${query.toLowerCase()}`)
    setVehicles(response.data)
  }, [query])


  useEffect(() => {
    if (loading) { 
      getData().then(() => setLoading(false))
    }
  }, [loading, getData])


  return (
    <div className="container">
      <div className="centered-container">
        <h1>Vehicles</h1>
        <Filters setLoading={setLoading} setType={setType} setQuery={setQuery}/>
        { loading ? 
            <Spinner/> :                     
            <VehicleList vehicles={vehicles}/>
        }
      </div>
    </div>
  )
}

export default Home;