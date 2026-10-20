#!/bin/bash

# Program to run a Beauty Salon Appointment Scheduler

# To get the bikes available, you need to query the database from your script
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

# This will have a few options
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo Welcome to our Salon. How can we help you?

  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # read the list in format #) <service>
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  # check if the service exists
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # if no services available -> variable empty -> checks if the variable is empty
  if [[ -z $SERVICE_NAME ]]
  then
    # send to main menu
    MAIN_MENU "That service is not available. How can we help you today?"
  else  # for when it is available
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist (inserts a new one)
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get new customer name
      echo -e "\nIt looks like you are a new customer, so let me register you. What's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # format name of service and customer
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
    CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')

    # get customer time availability
    echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
    read SERVICE_TIME

    # insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # final
    echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
  
  fi
}


# Llamada inicial al menú principal (siempre al final del script)
MAIN_MENU