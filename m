Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386F377EBC
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821082; cv=none; b=G63YSSFUikXnh+pnO1ht5FXPn1FuK0nTDJEFWGr3XiddeXoWBAhIVK+09s4L4Vw8z6YUJgaSXTi6jfjHiq95Dk71TCSomZphaW1rXw6s0L5LeeC/FfSY3MSfCPOCpPCuEoDGC6aGSHmWE7u1MmMIpep38kY2GlW1fZAMU607l40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821082; c=relaxed/simple;
	bh=vO1KfHU6udCVhdGolP+Vsucc5fEMPxLUN7KgAjXoeyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFZReOBHdy/ijhbxcJq6U9UMOVxji5VVrVu8on5HTBaPmx4D5E+mpqhajySzxwJIINa5UQURmqtVnTBhiKgfE9XJ8Ucc4b7fX+a8rL7DzuqhTZhR/wtfTpODSirqS+htcYehjDbwuMFkF/vCMsB2Ct1ni2bxpBKM1yWCPfA3xGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso2959731e0c.2
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 01:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821079; x=1774425879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htBo4xRilBo5yz/WWU6Hy0WaZEltY58p9V1wJQpVl2w=;
        b=Ty5Ub+HcUM2swLyyM5GK44uks3LNjgbu9UjuaDgaI+LwIQevF9ucwMO1Q5mc+HBAoP
         /0VWpICl1FbUJFB2Jmn+k3Hxdq72Stso9cys0ZKJ72vaL5zicnpt9Bt1fg1pfjIG/Ut5
         zQgTpk8rGNMEGetu+GohOFSmAho4W/ZJWl/FTdjDzPpcR0A2jbA8TZm/K5/p7bJBfHWk
         A8Bm8KionfxjNbBWsc2AX9u1cM5c0s5RmzAcfWjkgtGno2TeuFUfL8WW3iSHKcKC1xBi
         9rW8t/5rFOYJ1lYvnbWvws7juEj9OhNxOIWFyiIm4VSNsrFuxGpaOxwp5lBgl/zqL0in
         XebA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ejP32PDZZRCPorLAIIunXCdKV0GKc/gLGiVTcbID3mr1/NBCROs9YGkzUz5gZS4Ks2galo8CmIHCFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8R8ElyWu3l56fAZpZ2b5TgnAACWdp2F/HMfWQO2dfDadX8hyi
	JPZ/QPGsbpaiD2ujW4qZTY1eLqAyGalTLSlMUiZHIz9YsSlcXgBdYANXDjCCdyr0JzE=
X-Gm-Gg: ATEYQzx6x8+mMVJ6UzuPI3h/YBM4jcYXGznrWvLlEBNjPYgNJdbYKgcSqDk4vupxfUe
	iqGntc17P4g/K+qC44QN6P0fBQAnwKgvymShRwFKCMCic99Q/LwNple9k+1kDuK0mCu5AauLdAJ
	gIgXWPvo77QhVXSpN5B97qXF3xBkrI6ZH9t95LowtVT3b6gdJW/iETk2O7UKpl+1PrRZg7bPuD/
	+NVLh0Cr+vUbvmX4Kz2zIusJ0vGo1c+JM2LLAAEMEnTA2TWcwKQaUwUt5ZkIOlbA/303GgbmZIn
	W17olz9upTqZA36xZzoc7Bqo5fJZRuuCu6mjehNm7AdMzuldFxRsISzKwf09xvA3cyPkpwI+a+t
	InmA6eopPdVSCsgbMmhdgeoAlIbFZWdh3KYv2EI7GRwgst4C1v5F47WtBnZsHj1HB8obeClvbzj
	sOkWOMdZbhkFf+/dQS8l9RbECSjS8XR5hEARV49xKg2og6AY12W2gnbbMH5pM8xpI5EIbUBc2OB
	zU=
X-Received: by 2002:a05:6122:82a8:b0:563:80e6:3b76 with SMTP id 71dfb90a1353d-56ba70524b6mr1381515e0c.7.1773821078396;
        Wed, 18 Mar 2026 01:04:38 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e82b4asm1227106e0c.8.2026.03.18.01.04.37
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:04:37 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b679e72d9so1971481e0c.3
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 01:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtumQAoL2CRazoBPUwdC9djRhKaZjDFHks89n2govZ8LkjEufyli8KGlDvNkNi47Wst0VO7zY96CeBpg==@lists.linux.dev
X-Received: by 2002:a05:6102:3593:b0:5ff:efdc:e225 with SMTP id
 ada2fe7eead31-6027d0a6617mr1172832137.3.1773821077123; Wed, 18 Mar 2026
 01:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317210828.2117631-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260317210828.2117631-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 09:04:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOj=C36-iWsRzY6Cr2eFLvpqi7cA_ebziKKdVCo+125A@mail.gmail.com>
X-Gm-Features: AaiRm52fFj4ja3SGclYxUj6sdp11dKwy3IN0zm7jJH3ap-zU4mNmHSvyveljUE0
Message-ID: <CAMuHMdVOj=C36-iWsRzY6Cr2eFLvpqi7cA_ebziKKdVCo+125A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] device property: Document how to check for the
 property presence
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC devicetree

On Tue, 17 Mar 2026 at 22:08, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Currently it's unclear if one may or may not rely on the error codes
> returned from the property getters to check for the property presence.
> Clarify this by mass updating kernel-doc for fwnode_property_*() and
> device_property_*() where it's applicable.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: 4b24f1f4-b395-467a-81b7-1334a2d48845@roeck-us.net

Missing "https://lore.kernel.org/" prefix.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/base/property.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 8d9a34be57fb..bffa0070ab13 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -38,6 +38,8 @@ EXPORT_SYMBOL_GPL(__dev_fwnode_const);
>   * @propname: Name of the property
>   *
>   * Check if property @propname is present in the device firmware description.
> + * This function is the correct way to check that given property is present
> + * in the device firmware description.
>   *
>   * Return: true if property @propname is present. Otherwise, returns false.
>   */
> @@ -52,6 +54,10 @@ EXPORT_SYMBOL_GPL(device_property_present);
>   * @fwnode: Firmware node whose property to check
>   * @propname: Name of the property
>   *
> + * Check if property @propname is present in the firmware node description.
> + * This function is the correct way to check that given property is present
> + * in the firmware node description.
> + *
>   * Return: true if property @propname is present. Otherwise, returns false.
>   */
>  bool fwnode_property_present(const struct fwnode_handle *fwnode,
> @@ -75,9 +81,9 @@ EXPORT_SYMBOL_GPL(fwnode_property_present);
>   * @dev: Device whose property is being checked
>   * @propname: Name of the property
>   *
> - * Return if property @propname is true or false in the device firmware description.
> + * Use device_property_present() to check for the property presence.
>   *
> - * Return: true if property @propname is present. Otherwise, returns false.
> + * Return: if property @propname is true or false in the device firmware description.
>   */
>  bool device_property_read_bool(const struct device *dev, const char *propname)
>  {
> @@ -90,7 +96,9 @@ EXPORT_SYMBOL_GPL(device_property_read_bool);
>   * @fwnode: Firmware node whose property to check
>   * @propname: Name of the property
>   *
> - * Return if property @propname is true or false in the firmware description.
> + * Use fwnode_property_present() to check for the property presence.
> + *
> + * Return: if property @propname is true or false in the firmware node description.
>   */
>  bool fwnode_property_read_bool(const struct fwnode_handle *fwnode,
>                              const char *propname)
> @@ -121,6 +129,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_read_bool);
>   * It's recommended to call device_property_count_u8() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use device_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -149,6 +159,8 @@ EXPORT_SYMBOL_GPL(device_property_read_u8_array);
>   * It's recommended to call device_property_count_u16() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use device_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -177,6 +189,8 @@ EXPORT_SYMBOL_GPL(device_property_read_u16_array);
>   * It's recommended to call device_property_count_u32() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use device_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -205,6 +219,8 @@ EXPORT_SYMBOL_GPL(device_property_read_u32_array);
>   * It's recommended to call device_property_count_u64() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use device_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -233,6 +249,8 @@ EXPORT_SYMBOL_GPL(device_property_read_u64_array);
>   * It's recommended to call device_property_string_array_count() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use device_property_present().
> + *
>   * Return: number of values read on success if @val is non-NULL,
>   *        number of values available on success if @val is NULL,
>   *        %-EINVAL if given arguments are not valid,
> @@ -257,6 +275,8 @@ EXPORT_SYMBOL_GPL(device_property_read_string_array);
>   * Function reads property @propname from the device firmware description and
>   * stores the value into @val if found. The value is checked to be a string.
>   *
> + * In order to check for the property presence, use device_property_present().
> + *
>   * Return: %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
>   *        %-ENODATA if the property does not have a value,
> @@ -324,6 +344,8 @@ static int fwnode_property_read_int_array(const struct fwnode_handle *fwnode,
>   * It's recommended to call fwnode_property_count_u8() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use fwnode_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -353,6 +375,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_read_u8_array);
>   * It's recommended to call fwnode_property_count_u16() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use fwnode_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -382,6 +406,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_read_u16_array);
>   * It's recommended to call fwnode_property_count_u32() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use fwnode_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -411,6 +437,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_read_u32_array);
>   * It's recommended to call fwnode_property_count_u64() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use fwnode_property_present().
> + *
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
> @@ -440,6 +468,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_read_u64_array);
>   * It's recommended to call fwnode_property_string_array_count() instead of calling
>   * this function with @val equals %NULL and @nval equals 0.
>   *
> + * In order to check for the property presence, use fwnode_property_present().
> + *
>   * Return: number of values read on success if @val is non-NULL,
>   *        number of values available on success if @val is NULL,
>   *        %-EINVAL if given arguments are not valid,
> @@ -476,6 +506,8 @@ EXPORT_SYMBOL_GPL(fwnode_property_read_string_array);
>   * Read property @propname from the given firmware node and store the value into
>   * @val if found.  The value is checked to be a string.
>   *
> + * In order to check for the property presence, use fwnode_property_present().
> + *
>   * Return: %0 if the property was found (success),
>   *        %-EINVAL if given arguments are not valid,
>   *        %-ENODATA if the property does not have a value,
> --
> 2.50.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
