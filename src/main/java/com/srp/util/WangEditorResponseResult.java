package com.srp.util;

import lombok.Data;

@Data
public class WangEditorResponseResult<T> {
    private int errno;

    private T data;

    public static <T> WangEditorResponseResult renderSuccess(T data,int errno){

        WangEditorResponseResult<T> objectResponseResult = new WangEditorResponseResult<>();

        objectResponseResult.setErrno(errno);

        objectResponseResult.setData(data);

        return objectResponseResult;
    }
}
