import { connect } from 'react-redux';
import AppLoader from './NetworkBar';
import { getNetworkInfo } from '../../actions';

export const mapStateToProps = ({ app: { isConnected } }) => ({ isConnected });

const mapDispatchToProps = {
	getNetworkInfo
};

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(AppLoader);
