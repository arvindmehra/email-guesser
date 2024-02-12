import React, { useState } from 'react';
import axios from 'axios';

const EmailFinder = () => {
  const [formData, setFormData] = useState({
    first_name: '',
    last_name: '',
    domain: ''
  });
  const [emailResult, setEmailResult] = useState('');
  const [error, setError] = useState('');

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  const API_URL = 'http://localhost:3000/api/v1/email_guesser/analyze';

  const handleSubmit = async (e) => {
    e.preventDefault();
    setEmailResult('');
    setError('');

    try {
      const response = await axios.post(API_URL, formData);
      setEmailResult(response.data.email);
    } catch (err) {
      setError(err.response?.data?.error || 'An unexpected error occurred');
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="first_name"
          value={formData.first_name}
          onChange={handleChange}
          placeholder="First Name"
          required
        />
        <input
          type="text"
          name="last_name"
          value={formData.last_name}
          onChange={handleChange}
          placeholder="Last Name"
          required
        />
        <input
          type="text"
          name="domain"
          value={formData.domain}
          onChange={handleChange}
          placeholder="Domain"
          required
        />
        <button type="submit">Find Email</button>
      </form>
      {emailResult && <div>Found Email: {emailResult}</div>}
      {error && <div>Error: {error}</div>}
    </div>
  );
};

export default EmailFinder;
