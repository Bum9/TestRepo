import * as styled_HM from "../../../../../styled/HeaderModal";
import {Link} from "react-router-dom";
import {useSelector} from "react-redux";

export const MSInner1 = () => {
    const user = useSelector(state => state.user);

    return (
        user.email === "" ? (
            <>
                <styled_HM.NLUl>
                    <styled_HM.NLULi>
                        <Link to={"/login"} style={{textDecoration: "none"}}>
                            <styled_HM.NLULiP>
                                리워드 및 혜택
                            </styled_HM.NLULiP>
                        </Link>
                    </styled_HM.NLULi>
                    <styled_HM.NLULi>
                        <Link to={"/login"} style={{textDecoration: "none"}}>
                            <styled_HM.NLULiP>
                                별 히스토리
                            </styled_HM.NLULiP>
                        </Link>
                    </styled_HM.NLULi>
                </styled_HM.NLUl>
            </>
        ) : (
            <>
                <styled_HM.NLUl>
                    <styled_HM.NLULi>
                        <Link to={"/serviceReady"} style={{textDecoration: "none"}}>
                            <styled_HM.NLULiP>
                                리워드 및 혜택
                            </styled_HM.NLULiP>
                        </Link>
                    </styled_HM.NLULi>
                    <styled_HM.NLULi>
                        <Link to={"/serviceReady"} style={{textDecoration: "none"}}>
                            <styled_HM.NLULiP>
                                별 히스토리
                            </styled_HM.NLULiP>
                        </Link>
                    </styled_HM.NLULi>
                </styled_HM.NLUl>
            </>
            )
    )
};