var Product = React.createClass({
  render: function() {
    if (this.props.active) var active = 'Active';
    else var active = 'Inactive';
    var price = '$' + this.props.price.toFixed(2);
    return (
      <tr>
        <td>{this.props.product}</td>
        <td>{price}</td>
        <td>{this.props.description}</td>
        <td>{active}</td>
        <td>{this.props.date_created}</td>
      </tr>
    );
  }
});

var ProductList = React.createClass({
  componentDidUpdate: function() {
    $('#productList').DataTable({
      "columns": [
        { "data": "product" },
        { "data": "price" },
        { "data": "description" },
        { "data": "active" },
        { "data": "date_created" }
      ]
    });
  },
  render: function() {
    if (this.props.data) {
      var listHTML = this.props.data.map(function(product) {
        return (
          <Product 
            key={product.id} 
            product={product.name} 
            price={product.price}
            description={product.description} 
            active={product.active} 
            date_created={product.date_created} />
        );
      });
    }
    return (
      <div className="value-prop">
        <div className="container">
          <h1>Your Product List</h1>
          <img src="/img/loading.gif" alt="Loading.." id="loading" />
          <table id="productList">
            <thead>
              <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Description</th>
                <th>Active</th>
                <th>Date Created</th>
              </tr>
            </thead>
            <tbody>
              {listHTML}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
});

var Header = React.createClass({
  render: function() {
    return (
      <nav className="navbar navbar-default navbar-static-top">
        <div className="container-fluid">
          <div className="navbar-header">
            <a className="navbar-brand" href="/">
              <img 
                alt="Wave Challenge" 
                src="https://www.waveapps.com/sitestatic/public/img/logo-dark.png?6b289ca884bd" 
                height="30px" />
            </a>
          </div>
        </div>
      </nav>
    );
  }
});

var ContentContainer = React.createClass({
  fetchProducts: function() {
    $("#loading").fadeIn();
    var url = "https://api.waveapps.com/businesses/" +
      this.props.businessId + "/products/?access_token=" + 
      this.props.accessToken;
    var token = this.props.accessToken;
    $.ajax({
      url: url,
      type: "GET",
      dataType: 'json',
      cache: false,
      beforeSend: function(xhr) {
        xhr.setRequestHeader("Authorization", "Bearer " + token);
      },
      success: function(data) {
        this.setState({data: data});
        console.log(data);
        $("#loading").fadeOut();
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.businessId, status, err.toString());
        $("#loading").fadeOut();
      }.bind(this)
    });
  },
  componentDidMount: function() {
    this.fetchProducts();
  },
  getInitialState: function() {
    return {data: []};
  },
  render: function() {
    return (
      <div className="content">
        <Header />
        <ProductList 
          data={this.state.data} />
      </div>
    );
  }
});

ReactDOM.render(
  <ContentContainer 
    businessId="89746d57-c25f-4cec-9c63-34d7780b044b"
    accessToken="6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm" />,
  document.getElementById('content')
);
