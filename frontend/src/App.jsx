import { useEffect, useState } from 'react'
import '../node_modules/bootstrap/dist/css/bootstrap.min.css'
import axios from 'axios';
import ReactPaginate from 'react-paginate';

function App() {

  
  //number of data shows on a page in pagination
  let limit = 10;

  const [user, setUser] = useState([]);

  //for pagination
  const [pageCount, setPageCount] = useState(0);

  //for filter
  const [email, setEmail] = useState("");
  const [salary, setSalary] = useState("");

  //for soring
  const [sortKey, setSortKey] = useState("");

  //executes on starting the app
  useEffect(()=>{
      getUser();
  }, [])


  /******************* Methods for pagination starts **************************/

  const getUser = async () => {
    const result = await axios.get(`http://localhost:8080/api/v1/user?page=0&limit=${limit}`);

    const totalPage = result.headers.get('x-total-count');

    setPageCount(Math.ceil(totalPage / limit));

    setUser(result.data);
  }
    

  const loadUser = async (currentPage) => {

    //this API call is for pagination with filtering and sorting
    const result = await axios.get(`http://localhost:8080/api/v1/user/result?page=${currentPage}&limit=${limit}&email=${email}&salary=${salary}&key=${sortKey}`);

    //this API call is for pagination with all data
    //const result = await axios.get(`http://localhost:8080/api/v1/user?page=${currentPage}&limit=${limit}`);

    //console.log(result.data);
    setUser(result.data);
  }

  const handlePageClick = (data) => {
    // console.log(data.selected);
    let currentPage = data.selected;
    //console.log(currentPage);
    loadUser(currentPage);
  }
  /***************** end ***************/



  /**************** Filter method starts ****************/

  const filterOnSubmit = async (e) => {

    e.preventDefault();

    const result = await axios.get(`http://localhost:8080/api/v1/user/result/filter?email=${email}&salary=${salary}`);
    //console.log(result.data);
    setUser(result.data);
  }

  const changeEmail = (e) => {
    setEmail(e.target.value);
    // console.log(email);
  }

  const changeSalary = (e) => {
    setSalary(e.target.value);
    // console.log(salary);
  }
  /*************** end *****************/



  /*************** Sort method starts *****************/
  const sortOnSubmit = async (e) => {

    e.preventDefault();

    const result = await axios.get(`http://localhost:8080/api/v1/user/sort?key=${sortKey}`);
    //console.log(result.data);
    setUser(result.data);
  }

  const changeSortKey = (e) => {
    setSortKey(e.target.value);
    // console.log(sortKey);
  }
  /*************** end *******************/


  /*************** Method for pagination with filtering and sorting starts **************************/
  const handleSearchByAll = async (e) => {
    e.preventDefault();
    const result = await axios.get(`http://localhost:8080/api/v1/user/result?page=0&limit=${limit}&email=${email}&salary=${salary}&key=${sortKey}`);
    //console.log(result.data);

    const totalPage = result.headers.get('x-total-count');

    setPageCount(Math.ceil(totalPage / limit));

    setUser(result.data);
  }
  /*************************** end *********************************/
  return (
    <>
      <div className="container">

        {/* for filtering data */}
        <div className="my-4 mx-4" >
          <div className="email">
            <h3>Select Email</h3>
            <input type="radio" name="email" value="gmail" id='gmail' onChange={changeEmail} /> <label htmlFor="gmail"> Gmail</label>
            <input type="radio" name="email" value="hotmail" id='hotmail' onChange={changeEmail} /> <label htmlFor="hotmail"> Hotmail</label>
            <input type="radio" name="email" value="yahoo" id='yahoo' onChange={changeEmail} /> <label htmlFor="yahoo"> Yahoo</label>
            <input type="radio" name="email" value="notApplicable" id='notApplicableEmail' onChange={()=>setEmail("")} /> <label htmlFor="notApplicableEmail"> Not Applicable</label>
          </div>

          <div className="salary">
            <h3>Select Salary</h3>
            <input type="radio" name="salary" value="25000" id='25000' onChange={changeSalary} /> <label htmlFor="25000"> 25000</label>
            <input type="radio" name="salary" value="35000" id='35000' onChange={changeSalary} /> <label htmlFor="35000"> 35000</label>
            <input type="radio" name="salary" value="45000" id='45000' onChange={changeSalary} /> <label htmlFor="45000"> 45000</label>
            <input type="radio" name="salary" value="55000" id='55000' onChange={changeSalary} /> <label htmlFor="55000"> 55000</label>
            <input type="radio" name="salary" value="65000" id='65000' onChange={changeSalary} /> <label htmlFor="65000"> 65000</label>
            <input type="radio" name="salary" value="notApplicable" id='notApplicableSalary' onChange={()=>setSalary("")} /> <label htmlFor="notApplicableSalary"> Not Applicable </label>
          </div>

          <button type='submit' className='btn btn-primary' onClick={(e)=>filterOnSubmit(e)}> Filter </button>
        </div>

        {/* for sorting data */}
        <div className="sorting my-4 mx-4">
          <div className="sort">
            <h3>Sort By</h3>
            <input type="radio" name="sortKey" value="name" id='name' onChange={changeSortKey} /> <label htmlFor="name"> Name</label>
            <input type="radio" name="sortKey" value="salary" id='salary' onChange={changeSortKey} /> <label htmlFor="salary"> Salary</label>
            <input type="radio" name="sortKey" value="notApplicable" id='notApplicableSortKey' onChange={()=>setSortKey("")} /> <label htmlFor="notApplicableSortKey"> Not Applicable </label>
          </div>

          <button className='btn btn-primary' onClick={sortOnSubmit}> Sort </button>
        </div>

        {/* for pagination with filtering and sorting */}
        <button className='btn btn-primary mx-4' onClick={handleSearchByAll}> Search By All Criteria </button>

        {/* for display data */}
        <div className="row m-2">
          {
            user.map((item, index) => {
              return  (<div key={index} className="col-sm-6 col-md-4 my-2">
                        <div className="card shadow"style={{width:'18rem'}}>
                          <div className="card-body">
                            <h4 className="card-title">ID: {item.id}</h4>
                            <h5 className='card-text'>Name: {item.name}</h5>
                            <h5 className='card-text'>Email: {item.email}</h5>
                            <h5 className='card-text'>Salary: {item.salary}</h5>
                          </div>
                        </div>
                      </div>)
            })
          }
        </div>
      
      {/* for pagination */}
      <ReactPaginate
          previousLabel={'previous'}
          nextLabel={'next'}
          breakLabel={'...'}
          pageCount={pageCount}
          marginPagesDisplayed={1}
          onPageChange={handlePageClick}
          containerClassName={'pagination justify-content-center'}
          pageClassName={'page-item'}
          pageLinkClassName={'page-link'}
          previousClassName={'page-item'}
          previousLinkClassName={'page-link'}
          nextClassName={'page-item'}
          nextLinkClassName={'page-link'}
          breakClassName={'page-item'}
          breakLinkClassName={'page-link'}
          activeClassName={'active'}
      />

      </div>
    </>
  )
}

export default App
