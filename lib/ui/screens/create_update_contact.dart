import 'package:contacts_app/packages/ui_kit/lib/ui_kit.dart';
import 'package:contacts_app/ui/di/navigation.dart';
import 'package:contacts_app/ui/screens/models/contacts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateUpdateContactScreen extends StatefulWidget {
  const CreateUpdateContactScreen({
    super.key,
    this.contactModel,
  });

  final ContactModel? contactModel;

  @override
  State<CreateUpdateContactScreen> createState() => _CreateUpdateContactScreenState();
}

class _CreateUpdateContactScreenState extends State<CreateUpdateContactScreen> {
  @override
  void initState() {
    if (widget.contactModel != null) {
      companyController.text = widget.contactModel!.company;
      nameController.text = widget.contactModel!.firstName;
      lastNameController.text = widget.contactModel!.lastName;
      streetAddress1.text = widget.contactModel!.streetAddress1;
      streetAddress2.text = widget.contactModel!.streetAddress2;
      city.text = widget.contactModel!.city;
      state.text = widget.contactModel!.state;
      zipCode.text = widget.contactModel!.zipCode;
      phoneController.text = widget.contactModel!.phoneNumber;
    }
    super.initState();
  }

  @override
  void dispose() {
    companyController.dispose();
    streetAddress1.dispose();
    streetAddress2.dispose();
    city.dispose();
    state.dispose();
    zipCode.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  final TextEditingController streetAddress1 = TextEditingController();
  final TextEditingController streetAddress2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController zipCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              if (widget.contactModel != null) {
                context.go(Routes.detail, extra: widget.contactModel);
              } else {
                context.go(Routes.init);
              }
            },
            child: Text(
              'Back',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
          ),
        ),
        trailing: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              ContactModel(
                idKey: widget.contactModel?.idKey ?? 0,
                firstName: nameController.value.text,
                lastName: lastNameController.value.text,
                company: companyController.value.text,
                phoneNumber: phoneController.value.text,
                streetAddress1: streetAddress1.value.text,
                streetAddress2: streetAddress2.value.text,
                city: city.value.text,
                state: state.value.text,
                zipCode: zipCode.value.text,
              );
            },
            child: GestureDetector(
              onTap: () async {
                await context.read<ContactsCubit>().crud(
                      actionType:
                          widget.contactModel != null ? ContactsCubitActionEnum.update : ContactsCubitActionEnum.create,
                      value: _getContact,
                    );
                context.go(Routes.init);
              },
              child: Text(
                'Done',
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ProfileWidget(
                    name: nameController,
                    surname: lastNameController,
                  ),
                ),
                NameLastNameCompanyWidget(
                  controllerName: nameController,
                  controllerCompany: companyController,
                  controllerSecondName: lastNameController,
                ),
                const SizedBox(height: 50.0),
                DropTextFieldWidget(
                  dropWidget: DropTextFieldChild(
                    controllers: [phoneController],
                    titleText: 'primary',
                    hints: const [
                      'phone',
                    ],
                  ),
                  addTitle: 'add phone',
                ),
                const SizedBox(height: 50.0),
                DropTextFieldWidget(
                  dropWidget: DropTextFieldChild(
                    controllers: [
                      streetAddress1,
                      streetAddress2,
                      city,
                      state,
                      zipCode,
                    ],
                    titleText: 'home',
                    hints: const [
                      'street address 1',
                      'street address 2',
                      'city',
                      'state',
                      'zip code',
                    ],
                  ),
                  addTitle: 'add address',
                ),
                const SizedBox(height: 30.0),
                if (widget.contactModel != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: GestureDetector(
                      onTap: () async {
                        await context.read<ContactsCubit>().crud(
                          actionType: ContactsCubitActionEnum.delete,
                          ids: [widget.contactModel!.idKey],
                        );
                        context.go(Routes.init);
                      },
                      child: Text(
                        'Delete',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: CupertinoColors.destructiveRed,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ContactModel get _getContact => ContactModel(
        idKey: widget.contactModel?.idKey ?? 0,
        firstName: nameController.value.text == '' ? 'empty name' : nameController.value.text,
        lastName: lastNameController.value.text == '' ? 'empty last name' : lastNameController.value.text,
        company: companyController.value.text,
        phoneNumber: phoneController.value.text == '' ? '123456678' : phoneController.value.text,
        streetAddress1: streetAddress1.value.text,
        streetAddress2: streetAddress2.value.text,
        city: city.value.text,
        state: state.value.text,
        zipCode: zipCode.value.text,
      );
}
