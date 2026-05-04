Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1F3EDACB;
	Mon,  4 May 2026 19:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922300; cv=none; b=jCWWAYMINuGZR6d4i8p2eI4MFJiybovYFV7Y3Tk/MYQ1OSDbmUedVa9hI+ebTwDSJpOr7kKHa5HqZzZpORWESOSr9dPSlOrx+XmCjjos0o87voGIZcXPFAUd4HmfgnN5fDO1Vd0JQj5PqCuZMb7YrZdcMkx+6wns6xb+JQbqx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922300; c=relaxed/simple;
	bh=mKmuduDbsXYPyhvz0wTH0UxmB1iLrZSij+WBS+0UjSE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IDllnUioYtvezqA+rRLS+nZJf5Ok6IfJREHUJlwWxWbwwsnl5uaIIzwVDNPx3OZAO+fAisAdDReRA54AMbn3kT9NEZZN9hP8GvP109zLB0gGMI4WquFBqO5PfzxhYacFneNo7ras1LJP3iiAEPPqSpyXRUmfRI/DxycQP1uV88k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5GpB1Ur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5GpB1Ur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C29AC2BCB8;
	Mon,  4 May 2026 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777922300;
	bh=mKmuduDbsXYPyhvz0wTH0UxmB1iLrZSij+WBS+0UjSE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=q5GpB1UrZhPmSqB/bZSkLiCnScbL/N0MibHlFWyeYDruRGCjJVqa1m4K2u+5Tk3RZ
	 ulb4+ixiQO/aOXgExM9PGTUTkUkecryxpJT9JJ3bSctB7LvZqBWkNkr1iF01Ar1p2f
	 UOV5V37nS90U2GPAJTJK54Qne84sD5zmVYs2l8JfA+D5UpJvMlREHHu4ICYHKlHQe5
	 RqmPaRm4XXw/nK4od2B6CLIpiIyXFIzK9jxv9ZrYENWr5JSzFh5lU0EEY1tpVtl3gK
	 L+lmpK/4qRrZuXkLeE7ytNxxKvvcGFuIJZZcJUTsHoWG3Xi76nvq3gLW2UV7ETaye1
	 0Tta5f18rT5gQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 21:18:16 +0200
Message-Id: <DIA4URMZOEAU.1146WQ3M1DO7M@kernel.org>
Subject: Re: [PATCH v2] firmware_loader: fix device reference leak in
 firmware_upload_register()
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Tianfei zhang"
 <tianfei.zhang@intel.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Guangshuo Li" <lgs201920130244@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260418070220.64542-1-lgs201920130244@gmail.com>
In-Reply-To: <20260418070220.64542-1-lgs201920130244@gmail.com>

On Sat Apr 18, 2026 at 9:02 AM CEST, Guangshuo Li wrote:
> diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/f=
irmware_loader/sysfs_upload.c
> index f59a7856934c..a6dab34b22d8 100644
> --- a/drivers/base/firmware_loader/sysfs_upload.c
> +++ b/drivers/base/firmware_loader/sysfs_upload.c
> @@ -351,7 +351,8 @@ firmware_upload_register(struct module *module, struc=
t device *parent,
>  	if (ret !=3D 0) {
>  		if (ret > 0)
>  			ret =3D -EINVAL;
> -		goto free_fw_sysfs;
> +		put_device(fw_dev);
> +		goto exit_module_put;
>  	}
>  	fw_priv->is_paged_buf =3D true;
>  	fw_sysfs->fw_priv =3D fw_priv;

I think this assignment comes too late, by calling put_device() we eventual=
ly
end up in fw_upload_free() which expects this to be assigned already.

I didn't think it through entirely, but can we just move the

	fw_sysfs->fw_upload_priv =3D fw_upload_priv;

assignment to after alloc_lookup_fw_priv(), so fw_dev_release() does not en=
ter
this path in the first place?
