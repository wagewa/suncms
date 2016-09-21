
package com.sunkun.suncms.utils;

import java.util.ArrayList;
import java.util.List;

public class SKutils
{
    public static List<Integer> StringToList(String ids)
    {
        List<Integer> list = new ArrayList<Integer>();
        String[] strs = ids.split(",");
        for (String s : strs)
        {
            list.add(Integer.parseInt(s));
        }
        return list;
    }
}
