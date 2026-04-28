Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B1477E35;
	Tue, 28 Apr 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777400574; cv=none; b=q1268ptJ6aeDR776aqKkgcbcDkb2wapGJyZE/MtCs4v/qgCu80zTJCFI0UjPgNmjW1HXM8Mp8CaToIgRSZDNrN5GREpciIBr6WZibXzXfbwmBNOCotfuZt/20q5a7j2L7RRDhWvzzkDzBqCaMhSMCgKibzIUoIrrP8QMBBvVDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777400574; c=relaxed/simple;
	bh=Qjsd3uIfQkniErIqXXZOa+Asxn83iT3n+U3qISVJt1M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qZR6wc7hiCqPNRGQkOA6GlM0BeFNC5+fEf3jzI/BlWBoGCAKh+QE/7QtM5tNkElCDNy8l/yU4aikp/i5P+6XKey0fQAG9wYqevHmxXpmygpLL4+pcjKlAmuBnEejr4VlPTjur5/WIovnVrBRo00k5oXlhkNHF3G3zXxnKbj+qb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWbQZXZy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWbQZXZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F56C2BCAF;
	Tue, 28 Apr 2026 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777400573;
	bh=Qjsd3uIfQkniErIqXXZOa+Asxn83iT3n+U3qISVJt1M=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=AWbQZXZylojtQrJm96K/00Z5HfftGed0m/IUkZ6sl8o4/ixwCyGrwyPVAuFyzhCSZ
	 6i/r4xy2eQWOiCnM1PKKEpxMLOTwXYTV0PBt7uxVwiqtBNdD4pz80+CJ5DHUbuJ8+u
	 NZACczwZthExFB4THX3WKkWK2xeMNgIA2vUH11JEk8uFpCwoW0HeqzkY73REYvK/jI
	 lxJVSjN3R2eVWSYv4Xm6uksmcbBvqITKaooJEVP5EZtVdw4yrhwc25klQKMufQTMs8
	 nDGUF6tr5LtwpxQUxYABjhXY9m1/nllN+lTFUz+LXkEAzA1LqHma33d3Fia3IZXN1T
	 XVGyeCZju62kg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 20:22:49 +0200
Message-Id: <DI4ZX1HOWDNH.3G36YTI0MYC76@kernel.org>
Subject: Re: [PATCH] drivers: base: Set mod->async_probe_requested if needed
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Igor Pylypiv" <ipylypiv@google.com>,
 "Chung-Kai Mei" <chungkai@google.com>, <stable@vger.kernel.org>
To: "Bart Van Assche" <bvanassche@acm.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260407160511.56289-1-bvanassche@acm.org>
In-Reply-To: <20260407160511.56289-1-bvanassche@acm.org>

On Tue Apr 7, 2026 at 6:05 PM CEST, Bart Van Assche wrote:
> If PROBE_PREFER_ASYNCHRONOUS is set for a device driver, and if loading
> other kernel modules depends on probing of that device driver to
> complete, e.g. because it is a storage driver, and if
> mod->async_probe_requested has not been set, then the
> async_synchronize_full() call in do_init_module() introduces a delay.
> Fix this by setting mod->async_probe_requested if
> PROBE_PREFER_ASYNCHRONOUS has been set. This patch reduces the Pixel 10
> boot time by 100 ms.
>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Aaron Tomlin <atomlin@atomlin.com>
> Cc: Igor Pylypiv <ipylypiv@google.com>
> Cc: Chung-Kai Mei <chungkai@google.com>
> Cc: stable@vger.kernel.org

Why does this have Cc: stable? I think this is just an improvement and not =
a
regression? If it is a regression, what's the commit that is fixed?

> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/base/module.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/base/module.c b/drivers/base/module.c
> index 218aaa096455..e58fc189d389 100644
> --- a/drivers/base/module.c
> +++ b/drivers/base/module.c
> @@ -39,6 +39,9 @@ int module_add_driver(struct module *mod, const struct =
device_driver *drv)
>  	if (!drv)
>  		return 0;
> =20
> +	if (mod && drv->probe_type =3D=3D PROBE_PREFER_ASYNCHRONOUS)
> +		mod->async_probe_requested =3D true;

What if userspace did explicitly pass async_probe=3D0?

> +
>  	if (mod)
>  		mk =3D &mod->mkobj;
>  	else if (drv->mod_name) {

