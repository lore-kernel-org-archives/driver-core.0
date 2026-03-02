Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A93358A6
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445634; cv=none; b=IlUzdGmSfIi8Q3Iwj3fBAAKtAKnFYr8REYLN5PHiV0H5MXyXeUJ/U8fWVqNV0NTiLZ7mL8Ll9JbbXB4W/OYBFbcjOYYC/UILyzr1CMeTXI5lZ4vF/nuHR45WykNMDPliiLNx7GaL+2748ZY5gv5f1svoXrrh0eF+RI12yvNC29Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445634; c=relaxed/simple;
	bh=4y2TOHi9TFOVkbjGDV689T/Smv9dTsRouELeh2CzMQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqJyiigg2wZOZ2p0L6xFFc0e7d1Ki0mXasngn1RTTs6Q+OIsw+WYNNSkKdRFjkyP4TeHGlser9W8S9kqA22wk885jgmLfL07o3l5/geG/6bfqkBJ2BVxx3AUHKBtfEn5RUfSbfpL7BCKqUVKklTS5OUgbrzM5A02gCU8Tf+2VuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fdf6ad2517so2619126137.2
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 02:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445632; x=1773050432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8HkRe6vR1zoQp8bGRDh2bo/ApHTR7KmRx9+/JW4v6E=;
        b=rfefxKw0LrKfIBMyTS13EDYjMcGt+ylZUh4oKnGy0OOhrTpnu7br/IXwb36p2f44is
         6KHTU2MeGV4lVf54DwvehkiuAzYiDBDGqG7ybj3BDMTN9Vk9/pHkAcP6ypeve5vHhS1j
         MGwb9V5cSB9orYVyJP6ei/8FWtMw4nhNmActanKfRzdnc/FH3afyRk113FJR1rfDv3t1
         /vktmFzvMipqvZF5BOcJsRQWRLr6naV3uH92Hkk9nsF7uY7LZgYdnSNw6MWEJDR3tqNQ
         w57bFNroiAQu4R4IP7WVYybpVZxn290tNJ/JUqW6os8E8yPK4Kf9q3a9N1Om0vgw0gLP
         6o3g==
X-Forwarded-Encrypted: i=1; AJvYcCWqozfplMr7b4eWwfQv2FFrYZtvPLQoGOvHH2ztVBkFkiKkYVZRIRs+Xvsiv5IwkykTmljjM7ISpRi/EA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/w5rsOzKl63qnByIMwvIscIET5DPCFyrUvhKQoRUa5HdXmPdV
	n1IyBXxz3E1rpMb0XDuhLYrQqCUfluqJNxQjSeEhnX8dRebJKmNhg9hxACKW3tty
X-Gm-Gg: ATEYQzyDQ6H9hXgzb+OJNBcF9wmO9CwgKd/jGCoWOb83gfUpXrWPuObJOIpEmWWejpt
	y0ATrr/aV+lGI/uvlwUkppARPE1uLW5pTQGaRk+hhESGMUZmNYjQR3/ae0rMG82DzdE5Si0VnK8
	liaDlhjFu0d6LIjPIozvsw6Xm4M1CROLHyZ+tz1icypA/l0G+Qu0RGVZpCTGELUHdTp5rXhdljF
	xwfjHvAxrHxSP8QCYJ0HOU6puPTMj2zm/VlaqNqMr3JfoZrck91Nr/Lu6lFvF+DnEFVs/W46nBR
	/ND/z1yFgLkkHjIv51P30JUKKNkM7GIHH4fevt1LxgNlt8WjLILjBdbZGFi/0638BpWRLB2oB2n
	YB4zsBLgHwj5VhNwz48mLZxTc/O8Da8pvbcIr1ZMd5OUnK4VrUkowpe/765d2+8fvsFxZZwcPEO
	74oxsQJJD5sHau6TglEkSdTleWY3walN1CPXqunpWZ6mCC+XKtgMBgt12P3kYHMfcx
X-Received: by 2002:a05:6102:5090:b0:5ef:8ad:a3bb with SMTP id ada2fe7eead31-5ff322f7f5amr5857289137.9.1772445631787;
        Mon, 02 Mar 2026 02:00:31 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6577a4fsm12151632241.10.2026.03.02.02.00.31
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:00:31 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a87d7c5d7so3473598e0c.3
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 02:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9ytgs5aZTYnRJCIg/TwtLMGhcxM9ejeCIgFHZn0Fo1ZUiKpayPUgVuoprq2AXkBEOccgDC22aE5WYDw==@lists.linux.dev
X-Received: by 2002:a05:6122:1c0f:b0:566:22e6:35df with SMTP id
 71dfb90a1353d-56aa09f82acmr5754346e0c.5.1772445631307; Mon, 02 Mar 2026
 02:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
X-Gm-Features: AaiRm52H_j84TKaKZyu39pwrVpDQPCGWPfmBnPTyHzO3FAF2JqSLhA9oDdBhutg
Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 2 Mar 2026 at 01:28, Danilo Krummrich <dakr@kernel.org> wrote:
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for your patch!

> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len = strlen(s);
> +

The newline case below is is basically the same case as the empty
string.  Hence if you would move the newline check here:

    if (len) {
            cp = strnchr(s, len, '\n');
            if (cp)
                    len = cp - s;
    }

then the "cp != s" check below is no longer needed.

> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old = dev->driver_override.name;
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }

Also, this block can be eliminated completely...

> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;

... by pre-initializing new to NULL, and making the allocation of new
conditional on len being non-zero.

> +
> +       spin_lock(&dev->driver_override.lock);
> +       old = dev->driver_override.name;
> +       if (cp != s) {
> +               dev->driver_override.name = new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
