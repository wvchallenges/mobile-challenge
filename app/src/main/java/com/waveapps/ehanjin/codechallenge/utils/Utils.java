package com.waveapps.ehanjin.codechallenge.utils;

import android.app.AlertDialog;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;

import com.waveapps.ehanjin.codechallenge.R;
import com.waveapps.ehanjin.codechallenge.model.Product;

import java.text.NumberFormat;
import java.util.Locale;

/**
 * Created by SJ on 12/7/16.
 */

public class Utils {

    public static String convertToDollarFormat(double number) {
        Locale locale = Locale.US;
        NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
        String formattedString = fmt.format(number);
        return formattedString;
    }

    public static void showProductInfoDialog(Context context, final Product obj) {
        LayoutInflater li = LayoutInflater.from(context);
        View promptsView = li.inflate(R.layout.dialog_product_detail, null);

        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);
        alertDialogBuilder.setView(promptsView);

        final EditText name = (EditText) promptsView.findViewById(R.id.editTextName);
        final EditText price = (EditText) promptsView.findViewById(R.id.editTextPrice);
        final EditText description = (EditText) promptsView.findViewById(R.id.editTextDescription);
        final EditText createdDate = (EditText) promptsView.findViewById(R.id.editTextCreatedDate);
        final EditText modifiedDate = (EditText) promptsView.findViewById(R.id.editTextModifiedDate);
//        final CheckBox visible = (CheckBox) promptsView.findViewById(R.id.checkboxVisible);

        name.setText(obj.getName());
        price.setText(convertToDollarFormat(obj.getPrice()));
        description.setText(String.valueOf(obj.getDescription()));

        createdDate.setText(String.valueOf(obj.getDateCreated()));
        modifiedDate.setText(String.valueOf(obj.getDateModified()));

        // set dialog message
        alertDialogBuilder.setCancelable(false);

        AlertDialog alertDialog = alertDialogBuilder.setCancelable(false).create();
        alertDialog.setCanceledOnTouchOutside(true);
        alertDialog.show();
    }
}
