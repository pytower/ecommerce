from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):

    def create_user(self, phone, username, age, password=None, **extra_fields):
        if not phone:
            raise ValueError('phone is required')

        user = self.model(phone=phone, username=username, age=age, **extra_fields)
        if password:
            user.set_password(password)
        else:
            user.set_unusable_password()
        user.save(using=self._db)
        return user

    def create_superuser(self, phone, username, age, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        user = self.create_user(phone=phone, username=username, age=age, **extra_fields)
        if password:
            user.set_password(password)
            user.save()
        return user
