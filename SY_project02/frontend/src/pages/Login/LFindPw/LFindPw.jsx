import * as styled_LOG from "../../../styled/Login/Login";
import * as styled_Join from "../../../styled/Join/Join";
import * as styled_LFId from "../../../styled/Login/LFindId";
import {Link} from "react-router-dom";
import * as styled_AB from "../../../styled/AllBox";
import Header from "../../../components/Header/Header";
import {Footer} from "../../../components/Footer/Footer";
import * as styled_LFPw from "../../../styled/Login/LFindPw";

const LFindPw = () => {
    return (
        <styled_AB.AllBox>
            <Header/>

            <styled_LFPw.LFPBox>
                <styled_LOG.LFB>
                    <styled_LOG.LFInner>
                        <styled_LOG.LFFFieldset>
                            <styled_Join.RFStrong>비밀번호 찾기</styled_Join.RFStrong>
                            <styled_Join.RFSection>
                                <styled_LFId.LFIDDiv>
                                    <styled_Join.RFSectionImg/>
                                    <styled_LFId.LFIDP>
                                        <styled_LFId.LFIDStrong>
                                            <styled_LFId.LFIDSpanColor>유저 아이디</styled_LFId.LFIDSpanColor>
                                            님의 비밀번호를 변경합니다.
                                        </styled_LFId.LFIDStrong>
                                        <styled_LFId.LFIDSpan>새로 사용할 비밀번호를 등록해주세요.</styled_LFId.LFIDSpan>
                                    </styled_LFId.LFIDP>

                                </styled_LFId.LFIDDiv>
                                {/*새 비밀번호*/}
                                <styled_LFPw.LFPDiv>
                                    <label>
                                        <styled_LFPw.LFPDStrong>새 비밀번호</styled_LFPw.LFPDStrong>
                                    </label>
                                    <styled_LFPw.LFPDInput
                                        type={"password"}
                                        placeholder={"비밀번호를 입력해 주세요."}
                                        required
                                    />
                                    {/*비밀번호 양식 틀릴 경우 보이게 만들기*/}
                                    <styled_LFPw.LFPDP>영문/숫자/특수기호를 혼합하여 8자리 이상 16자리 이하로 입력하세요.</styled_LFPw.LFPDP>
                                </styled_LFPw.LFPDiv>
                                {/*새 비밀번호 확인*/}
                                <styled_LFPw.LFPDiv>
                                    <label>
                                        <styled_LFPw.LFPDStrong>새 비밀번호 확인</styled_LFPw.LFPDStrong>
                                    </label>
                                    <styled_LFPw.LFPDInput
                                        type={"password"}
                                        placeholder={"비밀번호를 다시 한번 입력해 주세요."}
                                        required
                                    />
                                    {/*비밀번호와 같지 않을 경우 보이게 만들기*/}
                                    <styled_LFPw.LFPDP>일치하지 않습니다.</styled_LFPw.LFPDP>
                                </styled_LFPw.LFPDiv>
                                {/*안전한 비밀번호 만들기*/}
                                <styled_LFPw.LFPSafe>
                                    <styled_LFPw.LEPSStrong>안전한 비밀번호 만들기</styled_LFPw.LEPSStrong>
                                    <styled_LFPw.LEPSUl>
                                        <styled_LFPw.LEPSLi>
                                            영문/숫자/특수기호를 혼합하여 8자리 이상 16자리 이하로 입력하세요.
                                        </styled_LFPw.LEPSLi>
                                        <styled_LFPw.LEPSLi>
                                            아이디와 같은 비밀번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자,
                                            동일하게 반복된 숫자 등 다른 사람이 쉽게 알아낼 수 있는 비밀번호는 유출 위험이 높아
                                            사용하지 않는 것이 좋습니다.
                                        </styled_LFPw.LEPSLi>
                                        <styled_LFPw.LEPSLi>
                                            이전에 사용하셨던 비밀번호 를재사용할 경우 도용의 우려가 있으니, 가급적 새로운 비밀번호를
                                            사용해 주세요.
                                        </styled_LFPw.LEPSLi>
                                    </styled_LFPw.LEPSUl>
                                </styled_LFPw.LFPSafe>
                            </styled_Join.RFSection>
                            {/*취소, 확인 버튼*/}
                            <styled_LFPw.LEPBtnBox>
                                <styled_LFPw.LEPSUl>
                                    {/*취소*/}
                                    <Link to={"/login"}>
                                        <styled_LFPw.LEPBtn1>
                                            <styled_LFPw.LEPBtn1P>취소</styled_LFPw.LEPBtn1P>
                                        </styled_LFPw.LEPBtn1>
                                    </Link>
                                    {/*비밀번호 변경 후 확인 alert("비밀번호가 변경되었습니다")*/}
                                    <Link to={"/login"}>
                                        <styled_LFPw.LEPBtn2>
                                            <styled_LFPw.LEPBtn1P>확인</styled_LFPw.LEPBtn1P>
                                        </styled_LFPw.LEPBtn2>
                                    </Link>
                                </styled_LFPw.LEPSUl>
                            </styled_LFPw.LEPBtnBox>
                        </styled_LOG.LFFFieldset>
                    </styled_LOG.LFInner>
                </styled_LOG.LFB>
            </styled_LFPw.LFPBox>

            <Footer/>
        </styled_AB.AllBox>
    );
};

export default LFindPw;
