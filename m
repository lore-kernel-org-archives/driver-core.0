Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF121CC51
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298749; cv=none; b=QJp7Q/Zb7A/2VqZmvidXeDpGZiX0Um1qZ63GBwTEu3OlA3e9HEAFG1dsHQlH4kj/d7kWiKCVDrG1FDJlCOM08WlALs0TQaQ3jIyggSULRy5FLBgEjt3XwnL7VAAfzig09Mlip+gH0qxy5ngQ0CWxEOpXKiANvo/H6CKCtpjhwdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298749; c=relaxed/simple;
	bh=0ksfW5Vko6uQDAg6xIPyea02cAl3qOEmVU9J7o34O+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsxUQ5UK0Cz+CJq0T3Gvb7bLuVuBaGn26LS6FhQ7pCiY9j+tj5ilJ4E3hCXvFO4+37GOw12vgSkp1ZIqAGArXGqKzduQDsLrHc+3HiiHiuvruO86SiCFBVdnPixUui5IAwE/xPdyahMJ9v4wL6Nre0KHiiUezNg70hBWd8hlBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB+dXtM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB+dXtM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE18C4AF09
	for <driver-core@lists.linux.dev>; Thu,  5 Feb 2026 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298748;
	bh=0ksfW5Vko6uQDAg6xIPyea02cAl3qOEmVU9J7o34O+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hB+dXtM+8F2IqIO9bE4gRwUMdgTgC3OksfNWb7UA/9YJ/r6jB+JV0pP0ltnA8mLTD
	 DstYVEBxHYKlwRXCDRU/rydFKX6kdVvhrMpwsWQM+1BU/emMleVYXRdBAS+4pYRQ4G
	 xGZQq3Lvt69om67bdf/JQ/+ZzYy+3w6AsNbhmzpam2E0FRrx4yzz55lGZyLda640Px
	 kmi7eHLL7L9/GbeIkghKyVEAq8RAq1drWHySf2PjziaBKV0nX0IshwyJsrM50TWBd9
	 WzyvA0aJPIEOv1+DmybwqEMxuvu9yjYsrK269q0dmtiqcwakMtgjfgwsZ8KaVRn7sW
	 E9+L/dHeudquQ==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-66a68106cc6so324579eaf.1
        for <driver-core@lists.linux.dev>; Thu, 05 Feb 2026 05:39:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIpZwtpPv1ic/ISdrVAEhPqo3/LkG+kqm854TQ2eQsadtp2BHVjhr/PKNYhSqBNlsSki4fE4tejEr2cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyquK4jnUczZwkVBzORBoqT5NPVsUgmDDjGpQdB4+ovWertl+6F
	t3ACPHhIulCfSheMLlK1ThoMfTkT4M8c90aIN8fZOSCisvrwINWsAyFxuEYYif7Xrg80yhmR6K8
	3JrEYhQopuLl9YY1EvwcEHgt3UlTwGeg=
X-Received: by 2002:a05:6820:4687:b0:663:12b4:9574 with SMTP id
 006d021491bc7-66a203a723fmr2493032eaf.3.1770298747658; Thu, 05 Feb 2026
 05:39:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026020541-energize-graduate-981a@gregkh>
In-Reply-To: <2026020541-energize-graduate-981a@gregkh>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 5 Feb 2026 14:38:56 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g0ga=earm-azPe6EwYm=Amt_H5f6aManfS5t=YcHYQ3Q@mail.gmail.com>
X-Gm-Features: AZwV_Qi0E4y5sEfSVaBcP23lKrvyLgIc_JtohRuLYV2shTXgDBfCAFrwTbgdClU
Message-ID: <CAJZ5v0g0ga=earm-azPe6EwYm=Amt_H5f6aManfS5t=YcHYQ3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] sysfs: remove exports of sysfs_*change_owner()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 2:09=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Both sysfs_change_owner() and sysfs_file_change_owner() are exported to
> modules, but there are no in-kernel module users, so remove the exports
> so that crazy out-of-tree drivers don't get the impression that it is
> safe to call these functions at all.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  fs/sysfs/file.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 3825e780cc58..a8176c875f55 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -689,7 +689,6 @@ int sysfs_file_change_owner(struct kobject *kobj, con=
st char *name, kuid_t kuid,
>
>         return error;
>  }
> -EXPORT_SYMBOL_GPL(sysfs_file_change_owner);
>
>  /**
>   *     sysfs_change_owner - change owner of the given object.
> @@ -736,7 +735,6 @@ int sysfs_change_owner(struct kobject *kobj, kuid_t k=
uid, kgid_t kgid)
>
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(sysfs_change_owner);
>
>  /**
>   *     sysfs_emit - scnprintf equivalent, aware of PAGE_SIZE buffer.
> --
> 2.53.0
>
