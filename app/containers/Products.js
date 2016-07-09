import React, { Component, PropTypes } from 'react'
import {
  View,
  Text,
  ListView,
  Image,
  TouchableOpacity,
  TouchableHighlight,
  StyleSheet
} from 'react-native'
import ErrorOverlay from '../components/ErrorOverlay'
import LoadingOverlay from '../components/LoadingOverlay'
import { connect } from 'react-redux'
import { fetchProducts } from '../actions/products'

export const NavigationBarRouteMapper = {
  LeftButton(route, navigator, index, navState) {
    return null
  },

  RightButton(route, navigator, index, navState) {
    const { dispatch } = navigator.props
    return (
      <TouchableOpacity
        style={{flex: 1, justifyContent: 'center'}}
        onPress={() => dispatch(fetchProducts())}>
        <Text style={{margin: 10, fontSize: 18, color: 'white'}}>
          Reload
        </Text>
      </TouchableOpacity>
    )
  },

  Title(route, navigator, index, navState) {
    return (
      <View style={{flex: 1, justifyContent: 'center'}}>
        <Text style={{margin: 10, fontSize: 18, color: 'white'}}>
          Products
        </Text>
      </View>
    )
  }
}

class EmptyProducts extends Component {
  render() {
    return (
      <View style={styles.emptyProducts}>
        <Text style={styles.emptyProductsText}>
          No Products
        </Text>
      </View>
    )
  }
}

class Products extends Component {
  componentDidMount() {
    const { dispatch } = this.props
    dispatch(fetchProducts())
  }

  render() {
    const { products, error, isFetching } = this.props

    const isEmpty = products.length === 0

    const ds = new ListView.DataSource({
      rowHasChanged: (p1, p2) => p1.id !== p2.id
    });

    return (
      <View style={styles.container}>
        {isFetching ? (
          <LoadingOverlay />
        ) : (
          error ? <ErrorOverlay message={error.message} /> : (
            isEmpty ? <EmptyProducts /> : null
          )
        )}

        {(isEmpty || error) ? null : (
          <ListView
            style={styles.listView}
            dataSource={ds.cloneWithRows(products)}
            enableEmptySections={true}
            renderRow={this.renderRow.bind(this)}
            renderSeparator={(sectionID, rowID) => <View key={`${sectionID}-${rowID}`} style={styles.separator} />}
          />
        )}
      </View>
    )
  }

  renderRow(rowData, sectionID, rowID) {
    return (
      <TouchableHighlight onPress={() => this.props.onSelect(rowData)}>
        <View style={styles.row}>
          <View style={styles.rowLine}>
            <Text style={styles.name}>
              {rowData.name}
            </Text>
            <Text style={styles.price}>
              ${rowData.price}
            </Text>
          </View>

          <Text style={styles.subtitle} numberOfLines={3}>
            {rowData.description}
          </Text>
        </View>
      </TouchableHighlight>
    )
  }
}

Products.propTypes = {
  onSelect: PropTypes.func,
  products: PropTypes.array.isRequired
}

Products.defaultProps = {
  onSelect: () => {}
}

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  listView: {
    backgroundColor: null,
    flex: 1
  },
  emptyProducts: {
    flex: 1,
    backgroundColor: null,
    justifyContent: 'center',
    alignItems: 'center'
  },
  emptyProductsText: {
    textAlign: 'center',
    fontSize: 20
  },
  row: {
    flexDirection: 'column',
    justifyContent: 'center',
    padding: 10,
    backgroundColor: '#ffffff',
  },
  rowLine: {
    flexDirection: 'row'
  },
  subtitle: {
    fontSize: 14,
    color: '#999999',
    marginTop: 5
  },
  separator: {
    height: 0.5,
    backgroundColor: 'rgb(200,199,204)',
    marginLeft: 12
  },
  name: {
    flex: 0.5,
    fontSize: 18
  },
  price: {
    flex: 0.5,
    fontSize: 16,
    color: '#888888',
    textAlign: 'right'
  }
})

function mapStateToProps(state) {
  const {
    data,
    lastUpdated,
    error,
    isFetching
  } = state.products

  return {
    products: data,
    error,
    isFetching,
    lastUpdated
  }
}

export default connect(mapStateToProps)(Products)
