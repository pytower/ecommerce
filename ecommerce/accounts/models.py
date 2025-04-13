from django.contrib.auth.models import AbstractBaseUser, AbstractUser, PermissionsMixin
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from django.db import models

from .managers import UserManager


class User(AbstractBaseUser, PermissionsMixin):
    GENDER_CHOICES = [
        ('male', 'Male'),
        ('female', 'Female'),
        ('diverse', 'Diverse'),
        ('prefer_not_to_say', 'Prefer not to say'),
    ]

    phone = models.CharField(
        max_length=11,
        unique=True,
        validators=[
            RegexValidator(regex=r'^09\d{9}$',
                           message="Phone number must start with 09 and be 11 digits long.")
        ]
    )
    username = models.CharField(max_length=100, unique=True)
    full_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True, blank=True, null=True)
    age = models.PositiveSmallIntegerField(default=1, validators=[MinValueValidator(1), MaxValueValidator(100)])
    gender = models.CharField(choices=GENDER_CHOICES ,max_length=10 ,blank=True ,null=True)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    objects = UserManager()

    USERNAME_FIELD = 'phone'
    REQUIRED_FIELDS = ['username', 'age']


    def __str__(self):
        return f"{self.phone} - {self.full_name or 'User'}"

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"
        ordering = ['-id']
