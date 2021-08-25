package com.srp.util;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class LayuiResponseResult<T> {

    private int code;

    private String msg;

    private int count;

    @JsonProperty("data")
    private T data;

    public static <T> LayuiResponseResult renderSuccess(T data, int count) {


        LayuiResponseResult<T> objectResponseResult = new LayuiResponseResult<>();

        objectResponseResult.setCode(0);

        objectResponseResult.setCount(count);

        objectResponseResult.setData(data);

        objectResponseResult.setMsg("操作成功");

        return objectResponseResult;

    }

}

