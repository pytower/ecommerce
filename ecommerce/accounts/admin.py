from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import Group

from .models import User


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    list_display = ("phone", "username", "full_name", "is_active", "is_staff")
    list_filter = ("is_active", "is_staff", "gender")
    search_fields = ("phone", "username", "full_name", "email")
    ordering = ("-id",)

    fieldsets = (
        (None, {"fields": ("phone", "password")}),
        ("Personal Info", {"fields": ("username", "full_name", "email", "age", "gender")}),
        ("Permissions", {"fields": ("is_active", "is_staff", "is_superuser", "groups", "user_permissions")}),
        ("Important Dates", {"fields": ("last_login",)}),
    )

    add_fieldsets = (
        (None, {
            "classes": ("wide",),
            "fields": ("phone", "username", "full_name", "age", "password1", "password2"),
        }),
    )

    filter_horizontal = ("groups", "user_permissions")
