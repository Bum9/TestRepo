import { useEffect } from "react";
import axios from "axios";
import { SERVER_URL } from "../util/urls";
import { useNavigate } from "react-router-dom";

export const useTokenChecker = (reqUrl) => {
  const navigate = useNavigate();
  const authRequest = async () => {
    await axios.get(`${SERVER_URL}` + reqUrl);
  };

  useEffect(() => {
    authRequest().catch((err) => {
      if (err.response.status === 401) {
        alert(err.response.data.message);
        return navigate("/", { replace: true });
      } else return;
    });
  }, []);
  return { authRequest };
};
