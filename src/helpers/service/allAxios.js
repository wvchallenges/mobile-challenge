/* eslint-disable no-shadow */
import axios from 'axios';

export default async function (responses) {
  return axios
    .all(responses)
    .then(
      axios.spread((...responses) => {
        return responses;
      }),
    )
    .catch((errors) => {
      return errors.data;
    });
}
