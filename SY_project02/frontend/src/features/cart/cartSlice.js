import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { useEffect } from "react";

const url =
  "http://stopupsapi.shop:8080/api/?apikey=TeamYN1671673527249&Category=분류&Name=";

export const getCartItems = createAsyncThunk(
  "cart/getCartItems",
  async (_, thunkAPI) => {
    try {
      console.log(thunkAPI);
      const response = await axios(url); // url에 get요청
      return response.data;
    } catch (error) {
      return thunkAPI.rejectWithValue(
        "문제가 발생했습니다. 다시 시도해주세요.",
        console.error(error)
      );
    }
  }
);

const initialState = {
  cartItems: [], // 상품 종류
  amount: 0, // 각 상품의 갯수
  total: 0, // 총 가격
  isLoading: true,
  statusByName: {},
  toggle: false,
  totalAmount: 0,
};

const cartSlice = createSlice({
  name: "cart",
  initialState,
  reducers: {
    //장바구니에 상품 추가
    addToCart: (state, action) => {
      console.log(state.cartItems);
      const itemInCarts = state.cartItems.find(
        (item) => item.id === action.payload.id
      );

      if (itemInCarts) {
        itemInCarts.quantity++;
      } else {
        state.cartItems.push({ ...action.payload, quantity: 1 });
      }
      state.amount++;
    },
    clearCart: (state) => {
      state.cartItems = []; //is equal to next line ;
      //   return { cartItems: [] }; =  많은 수의 input을 한꺼번에 제어해야할때 유용하게 쓰일 수 있음
    },
    removeItem: (state, action) => {
      const itemId = action.payload;
      state.cartItems = state.cartItems.filter((item) => item.id !== itemId);
    },
    removeFromCart(state, action) {
      const itemIds = action.payload;
      // 특정 id값에 해당하는 상품만을 제거 = 선택된 아이템만 제거
      state.cartItems = state.cartItems.filter(
        (item) => !itemIds.includes(item.id)
      );
    },
    // addToItem: (state, action) => {
    //   const Item = action.payload;
    //   state.cartItems.push(Item);
    //   console.log(state.cartItems);
    //   state.totalAmount++;
    // },
    // toggle: (state, action) => {
    //   state.toggle = !state.toggle;
    // },
    increase: (state, action) => {
      const cartItem = state.cartItems.find(
        (item) => item.id === action.payload
      );
      cartItem.quantity = cartItem.quantity + 1;
    },
    decrease: (state, action) => {
      const item = state.cartItems.find((item) => item.id === action.payload);
      if (item.quantity === 1) {
        item.quantity = 1;
      } else {
        item.quantity--;
      }
    },
    // decrease: (state, action) => {
    //   const cartItem = state.cartItems.find(
    //       (item) => item.id === action.payload
    //   );
    //   cartItem.quantity = cartItem.quantity - 1;
    // },

    calculateTotals: (state, action) => {
      let amount = 0;
      let total = 0;

      const itemIds = action.payload;

      const Item = state.cartItems.filter((item) => itemIds.includes(item.id));

      Item.forEach((item) => {
        amount += item.quantity;
        total += item.quantity * item.price;
      });
      state.amount = amount;
      state.total = total;
    },
  },

  // 비동기 처리를 위한 createAsyncThunk reducer 함수들
  // 반환되는 promise의 상태에 따라 로딩 상태를 변경시킴
  // 이하 코드는 RTK Query 도입시 사용
  extraReducers: (builder) => {
    builder
      .addCase(getCartItems.pending, (state, action) => {
        state.statusByName = "pending";
        state.isLoading = true;
      })
      .addCase(getCartItems.fulfilled, (state, action) => {
        state.statusByName = "fulfilled";
        state.isLoading = false;
        state.cartItems = action.payload;
      })
      .addCase(getCartItems.rejected, (state, action) => {
        state.isLoading = false;
        state.statusByName = "rejected";
      });
  },
});

export const cartReducer = cartSlice.reducer;
export const {
  addToCart,
  addToItem,
  clearCart,
  removeItem,
  removeFromCart,
  increase,
  decrease,
  calculateTotals,
  toggle,
} = cartSlice.actions;
