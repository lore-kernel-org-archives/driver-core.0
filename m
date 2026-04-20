Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F0392C3A
	for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679204; cv=none; b=KG2/jMooFFMw37enzd/w3dRXm0k0+qiRpGwTOQnbgC2qgIRurAXVkr1hE3AeR8LIQ3islNzsSS5MUQcki6NoT0jtSYZt4w5asLZB2HFt2jBtlqfr/TtoGYj2UllbivAhVUggKFpe5DfP/85IrYqarndZaGjMLPlH+ZXVqe6i09Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679204; c=relaxed/simple;
	bh=sgyjlCd3REAuBKXLP0833y97EopfLxqqK9cKnnewZ0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPoXM5WpupnDwWBWVLnXUfudXZA3KYYQH4P5UmJ6dURTzNfyqMz+w4VylWa7LGqyuVKaCQFWAXTkHIeqAGsApbjGT/AY6whTpCIuvMSekPdRNbdH5/KzP5pRQYRSI1w4cYdY8bBm63Q796mORFOONEa6c5y9cvzrM8j+9oYMSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ozd9pc5V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ozd9pc5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188F0C2BCC6
	for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776679204;
	bh=sgyjlCd3REAuBKXLP0833y97EopfLxqqK9cKnnewZ0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ozd9pc5V8YWn90EIRtGWuE5oZnJVUDRqPlPTiFYvJwEASnWXzCbBxPI6RGQKlFdbd
	 aFpMvgDUrfkE12lFjlAHyTfd/ZlO7b8BPnxD2/lbPXFNsCmjTPrZTrY1JvXQA4obpt
	 lTRX6N8Y4p5+6s3j5UuxYpf8GxSVDr21JQbRyv95dobtP8YkgXjai3UR1B5xTUNiwv
	 4AtaUX10Av+CANEu+aJ++gNxkaOzcuBKh4B0bxw3mo5tITDwa0UHIelDAph7szsNvO
	 QPWsudaFn/8gqTcDv79U03/yKl0k84bgyBSGKc9UkiXTHybdyA0ebM9MRH2gsBADIG
	 V6RB2/tPFjj/Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a337552604so2876891e87.2
        for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 03:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/iiAFi04NBSELa0oNS36K9W1uCS5T/wq1k0scFHqHoCR0MI2QHRr0DezFCO8ZRUkkT6gFYsczzTdImMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFEcDhk1FN7TIWbaDk7GhDdp3SWopre/EMB8/FtaVybnTJ1vC5
	4Tr4Eqz0pgNYhpqYH/jFnCRChRIfbEQSRWROIOq4UcW/Yl7sKn/Z/8ppYJp/+XutQ1S4lYRk5MI
	c4whxyS/vj4uAjE215BUAzazOWDGrVjE=
X-Received: by 2002:a05:6512:1252:b0:5a2:b40b:3f86 with SMTP id
 2adb3069b0e04-5a4172f6493mr3924387e87.27.1776679201855; Mon, 20 Apr 2026
 03:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416-acpi_mod_name-v1-0-1a4d96fd86c9@sony.com> <20260416-acpi_mod_name-v1-1-1a4d96fd86c9@sony.com>
In-Reply-To: <20260416-acpi_mod_name-v1-1-1a4d96fd86c9@sony.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Apr 2026 11:59:36 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h0GhT4uskaippD1bgoxtRX5CT7-mT+8ELa4Ny+aHhuNA@mail.gmail.com>
X-Gm-Features: AQROBzBgYSjPgFASuJ3z_9TdPatjc4Rb0YJEziLHiMkL2UIQ_WtoXxCxVV4y_Z4
Message-ID: <CAJZ5v0h0GhT4uskaippD1bgoxtRX5CT7-mT+8ELa4Ny+aHhuNA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: bus: set mod_name in driver registration
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	acpica-devel@lists.linux.dev, driver-core@lists.linux.dev, 
	Rahul Bukte <rahul.bukte@sony.com>, Daniel Palmer <daniel.palmer@sony.com>, 
	Tim Bird <tim.bird@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 9:36=E2=80=AFAM Shashank Balaji
<shashank.mahadasyam@sony.com> wrote:
>
> Pass KBUILD_MODNAME through the driver registration macro so that
> the driver core can create the module symlink in sysfs for built-in
> drivers.
>
> Fixes: 48b9c4862bd3 ("ACPI: store owner from modules with acpi_bus_regist=
er_driver()")
> Assisted-by: Claude:claude-4.6-opus
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

All of the ACPI drivers are in the process of being converted to
platform drivers and the code updated below is slated for removal.

I'd rather not make this change TBH.

> ---
>  drivers/acpi/bus.c      | 5 ++++-
>  include/acpi/acpi_bus.h | 5 +++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 2ec095e2009e..152ef49e5970 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1062,18 +1062,21 @@ EXPORT_SYMBOL_GPL(acpi_driver_match_device);
>   * __acpi_bus_register_driver - register a driver with the ACPI bus
>   * @driver: driver being registered
>   * @owner: owning module/driver
> + * @mod_name: module name string
>   *
>   * Registers a driver with the ACPI bus.  Searches the namespace for all
>   * devices that match the driver's criteria and binds.  Returns zero for
>   * success or a negative error status for failure.
>   */
> -int __acpi_bus_register_driver(struct acpi_driver *driver, struct module=
 *owner)
> +int __acpi_bus_register_driver(struct acpi_driver *driver, struct module=
 *owner,
> +                              const char *mod_name)
>  {
>         if (acpi_disabled)
>                 return -ENODEV;
>         driver->drv.name =3D driver->name;
>         driver->drv.bus =3D &acpi_bus_type;
>         driver->drv.owner =3D owner;
> +       driver->drv.mod_name =3D mod_name;
>
>         return driver_register(&driver->drv);
>  }
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index b701b5f972cb..53952ec544e6 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -672,8 +672,9 @@ int acpi_scan_add_handler(struct acpi_scan_handler *h=
andler);
>   * use a macro to avoid include chaining to get THIS_MODULE
>   */
>  #define acpi_bus_register_driver(drv) \
> -       __acpi_bus_register_driver(drv, THIS_MODULE)
> -int __acpi_bus_register_driver(struct acpi_driver *driver, struct module=
 *owner);
> +       __acpi_bus_register_driver(drv, THIS_MODULE, KBUILD_MODNAME)
> +int __acpi_bus_register_driver(struct acpi_driver *driver, struct module=
 *owner,
> +                              const char *mod_name);
>  void acpi_bus_unregister_driver(struct acpi_driver *driver);
>  int acpi_bus_scan(acpi_handle handle);
>  void acpi_bus_trim(struct acpi_device *start);
>
> --
