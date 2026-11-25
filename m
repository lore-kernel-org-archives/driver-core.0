Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610584;
	b=QkSxgdFvp0FXecjMZzEibiCtVUEC1m4AGwiDG1ghsWfeo7RtW2eQNBjEXPiFZS8qpM3K
	 i0LQYNDUdMkWivCRTCXN1Xoy1lFKaxjgm/4GRqvsaFO7YfbMUP2vuHsv2Ui2DJ2JgnI4Q
	 3VEErDIJRk/c9/YAaWh5W05bIkJ/2U0w8EhFUiZvv9tT+wCzTJ8MOjnRoti15ClxpPdrb
	 CsYRWem547ekQBvVrqmXBO/J4ARRS/YOZ+rsG0fQmNJFZ/xrbmnpJrArjpzEqHlND3ICC
	 ex9sjNJ8o3hfMBk5PEkrU2DPOLlu7Jsm43ZY7OcheXTfUZAzWW6u/52wPI9xOntWjmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610584;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BVKqiS2iqCBcGWA+RsyURKlTSzk0qOWa1xpecr48ZA0=;
	b=id9Nr4UntdVr2XZmcXtxC6aANhN8Da48shwWPcpTYEkO0rkBIkwdbBL9RlJUOfC+DRhs
	 OKv1//oJd7cLw+QR8Y3HKgxzTBaqPUh5PmF56jMpSEP7ggaUupujbpUefsZFX0FtUZiyl
	 Ho8V4TlqbLX9/o7UTkEPmbncB/4EWo7HJOXAdhCZzM7kynLUoQeGmN0yPnC7NAgeVu+Zk
	 BFD6J74Jf1geRnlW9PIlTwcJ6qE4wBIbCXx0BlmrmJAG6Qw+Ow2TrtVcr4Z58jrmUE2QU
	 C5t2RwvQkfoKo7nQeSshh4G2xyBglHja26QzFveQVHSu60mpcd6pXRDqGT35Fw0tgYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4TgIn+T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F2D606A321
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4TgIn+T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EF41F000EC
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610583;
	bh=BVKqiS2iqCBcGWA+RsyURKlTSzk0qOWa1xpecr48ZA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f4TgIn+TMDeOW3k/gS/vCG8lNwyLF1Y/poHilRkmfXS5wKHVkXySpjkvEx9UlsCFC
	 WkHZCflVBm/dbFjkJQthvHFMjLlmK7Z9C1WXGm1Gub/wz2Dv8ZDHgPe26MhhrFEHPI
	 otRgORzccaq5DRJEyAZ2SAjjWDRFjBmdvlA8vac0M9kfvuxJBO9TijvORxAdVtquO/
	 Viz0HJUw00w5kZhVelgY8YR6l2I9cn5RI+ERSksaHDM8hMETDk6XS3pLrDOfryUuOJ
	 jBvokPXXF0X013UNiVa3k9NkaterqY8OZQgrjy3eiKCpQ9QWEXMKdG1VLQn+eHt5Uj
	 Q6gILZzVajv9A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be47aa555cso7158772e87.3
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 04:43:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGaMPYjW0VRKbxM1QwPY+fLP+csJ7vHdDJACuGW+ZSANPjfgU+wj/YYphfDTxFG2Dj7UhkBtAq2dzbuDA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9+7mp65VLM0Kl77B6Xdv6Neh9+1Fe5eIRLBrxVyLoNZkW1YwK3
	R2B8eK09y9HqN4SmkUC8A0CCh6qMczDUcB2s5VYVoWhvj/miu49eX0BFRVvGg+/vxagch+DCftH
	xYF1d0g8/plvI9oPi1RRA+FSvfhO3yIU=
X-Received: by 2002:a05:6512:31ce:b0:5bc:b0b9:f457 with SMTP id
 2adb3069b0e04-5c1bc80be1cmr5225392e87.47.1795610581845; Wed, 25 Nov 2026
 04:43:01 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123084218.673382-1-b-padhi@ti.com> <20261123084218.673382-2-b-padhi@ti.com>
In-Reply-To: <20261123084218.673382-2-b-padhi@ti.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 13:42:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hFxkiVpTYJRgqRVEY2hOmMqk7-2S+qeo7De19yn7bT0Q@mail.gmail.com>
X-Gm-Features: Aa3M54oDbnkqyJw2fKc7Zn3MFiurM1hEXB_4W8o4Qwap4SILpZ7JlD693JrkKTI
Message-ID: <CAJZ5v0hFxkiVpTYJRgqRVEY2hOmMqk7-2S+qeo7De19yn7bT0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM: domains: Honour PD_FLAG_ATTACH_POWER_ON for genpd
To: Beleswar Padhi <b-padhi@ti.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	johan@kernel.org, pavel@kernel.org, lenb@kernel.org, ulfh@kernel.org, 
	sid9.karanam@gmail.com, afd@ti.com, nm@ti.com, vigneshr@ti.com, 
	u-kumar1@ti.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:49=E2=80=AFAM Beleswar Padhi <b-padhi@ti.com> wro=
te:
>
> dev_pm_domain_attach() takes PD_FLAG_ATTACH_POWER_ON to let the caller
> decide whether the PM domain is powered on during attach. But, only the
> ACPI path honours it today. genpd_dev_pm_attach() takes no flags and
> always powers on the domain, so a DT based device cannot be attached to
> its PM domain without powering it on.
>
> Add a power_on argument to genpd_dev_pm_attach() and pass it on to
> __genpd_dev_pm_attach(), which already supports it for the multiple PM
> domains case.
>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Fine with me.

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
> No changes since RFC.
>
> Link to RFC:
> https://lore.kernel.org/all/20261027140751.2465743-2-b-padhi@ti.com/
>
>  drivers/base/power/common.c | 5 +++--
>  drivers/pmdomain/core.c     | 5 +++--
>  include/linux/pm_domain.h   | 4 ++--
>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> index 9bef9248a7052..3263659c58dc8 100644
> --- a/drivers/base/power/common.c
> +++ b/drivers/base/power/common.c
> @@ -102,14 +102,15 @@ EXPORT_SYMBOL_GPL(dev_pm_put_subsys_data);
>   */
>  int dev_pm_domain_attach(struct device *dev, u32 flags)
>  {
> +       bool power_on =3D !!(flags & PD_FLAG_ATTACH_POWER_ON);
>         int ret;
>
>         if (dev->pm_domain)
>                 return 0;
>
> -       ret =3D acpi_dev_pm_attach(dev, !!(flags & PD_FLAG_ATTACH_POWER_O=
N));
> +       ret =3D acpi_dev_pm_attach(dev, power_on);
>         if (!ret)
> -               ret =3D genpd_dev_pm_attach(dev);
> +               ret =3D genpd_dev_pm_attach(dev, power_on);
>
>         if (dev->pm_domain)
>                 dev->power.detach_power_off =3D !!(flags & PD_FLAG_DETACH=
_POWER_OFF);
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index e0bf30c59ccea..c73927ac07e2c 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3556,6 +3556,7 @@ static int __genpd_dev_pm_attach(struct device *dev=
, struct device *base_dev,
>  /**
>   * genpd_dev_pm_attach - Attach a device to its PM domain using DT.
>   * @dev: Device to attach.
> + * @power_on: Whether to power on the PM domain during attach.
>   *
>   * Parse device's OF node to find a PM domain specifier. If such is foun=
d,
>   * attaches the device to retrieved pm_domain ops.
> @@ -3566,7 +3567,7 @@ static int __genpd_dev_pm_attach(struct device *dev=
, struct device *base_dev,
>   * found or turned on, then return -EPROBE_DEFER to ensure that the devi=
ce is
>   * not probed and to re-try again later.
>   */
> -int genpd_dev_pm_attach(struct device *dev)
> +int genpd_dev_pm_attach(struct device *dev, bool power_on)
>  {
>         if (!dev->of_node)
>                 return 0;
> @@ -3579,7 +3580,7 @@ int genpd_dev_pm_attach(struct device *dev)
>                                        "#power-domain-cells") !=3D 1)
>                 return 0;
>
> -       return __genpd_dev_pm_attach(dev, dev, 0, 1, true);
> +       return __genpd_dev_pm_attach(dev, dev, 0, 1, power_on);
>  }
>  EXPORT_SYMBOL_GPL(genpd_dev_pm_attach);
>
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 14e0e346c610a..010fbfffee39d 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -481,7 +481,7 @@ int of_genpd_add_child_ids(struct device_node *np,
>  int of_genpd_remove_child_ids(struct device_node *np,
>                               struct genpd_onecell_data *data);
>
> -int genpd_dev_pm_attach(struct device *dev);
> +int genpd_dev_pm_attach(struct device *dev, bool power_on);
>  struct device *genpd_dev_pm_attach_by_id(struct device *dev,
>                                          unsigned int index);
>  struct device *genpd_dev_pm_attach_by_name(struct device *dev,
> @@ -527,7 +527,7 @@ static inline int of_genpd_parse_idle_states(struct d=
evice_node *dn,
>
>  static inline void of_genpd_sync_state(struct device_node *np) {}
>
> -static inline int genpd_dev_pm_attach(struct device *dev)
> +static inline int genpd_dev_pm_attach(struct device *dev, bool power_on)
>  {
>         return 0;
>  }
> --
> 2.34.1
>
