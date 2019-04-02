import { connect } from 'react-redux';
import AppLoader from './AppLoader';
import { getAppData } from '../../actions';

export const mapStateToProps = ({ app: { progress, isLoading } }) => ({ progress, isLoading });

const mapDispatchToProps = {
	getAppData
};

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(AppLoader);
