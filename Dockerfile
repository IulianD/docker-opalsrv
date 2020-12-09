FROM obiba/opal


RUN echo "opal project -o https://localhost:8443 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name test --database mongodb" >> /opt/opal/bin/first_run.sh
RUN echo "opal user --opal https://localhost:8443 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD  --add --name guest --upassword guest123" >> /opt/opal/bin/first_run.sh
RUN echo "opal perm-table --opal https://localhost:8443 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type USER --project test --subject guest  --permission view --add --tables CNSIM" >> /opt/opal/bin/first_run.sh
RUN echo "opal perm-datashield --opal https://localhost:8443 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type USER --subject guest --permission use --add" >> /opt/opal/bin/first_run.sh
RUN echo "opal rest /datashield/package/dsBase/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT" >> /opt/opal/bin/first_run.sh
RUN echo 'test $DRIVING_SITE=="TRUE" && (opal rest -o https://localhost:8443 --user administrator --password  password --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsSwissKnife")'  >> /opt/opal/bin/first_run.sh
RUN echo 'test $DRIVING_SITE=="TRUE" && (opal rest -o https://localhost:8443 --user administrator --password  password --method POST "/service/r/packages?name=DSI")'  >> /opt/opal/bin/first_run.sh
RUN echo 'test $DRIVING_SITE=="TRUE" && (opal rest -o https://localhost:8443 --user administrator --password  password --method POST "/service/r/packages?manager=gh&name=vanduttran/dsSSCP")'  >> /opt/opal/bin/first_run.sh
RUN echo 'test $DRIVING_SITE=="TRUE" && (opal rest -o https://localhost:8443 --user administrator --password  password --method POST "/service/r/packages?manager=gh&name=vanduttran/dsSSCPclient")'  >> /opt/opal/bin/first_run.sh
RUN echo "opal rest /datashield/package/dsSwissKnife/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT"  >> /opt/opal/bin/first_run.sh
RUN echo "opal rest /datashield/package/dsSSCP/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT"  >> /opt/opal/bin/first_run.sh
RUN echo "opal rest /datashield/package/dsSSCPclient/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT"  >> /opt/opal/bin/first_run.sh
