Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592208;
	b=dP/bnb3g4mxHOSL7ycaVn0xOObjqalCDyrV7DLuFAsl1hq7uYy3aJz+sSDfxXr+Be75J
	 4wpIBv/9bxs4fGWEANzOJvOxAtO6dMI3/HW0ZT/GL/ci9Nu30v+8ClBSIbC1zI2ia9Oui
	 j9g60ax0w/dx6ZtF0Ve8EWFlBsQPt08JH7b2Q2dz/fX7bvM/HH4YwVP2zn/xJJhm9iQM7
	 Jo67GoEiUcsETlyEmYVJujhL2UwQbcXBeLIntIIek01pFM5g7j7YZRYux9hwsuVSHekyW
	 dZu5wTvOhO5ihk8upU3KO6cJmrqPZiUKbO1tcgVtrXG1z6HrKUOEJ0Aym8Fzq1YzqEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592208;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EU1uYM/NmLFZaI8ig83tMQonoDZ93Lw71raJgl086sU=;
	b=tvfefjf7VuGR8bj4VOVOKtVUasgqA9U4FDxHmVklBSd5L5EfzY2EVyvUVyM5yi/CoSoO
	 i6TiVVAz3a207/nIS+CRlZreL/CVvmwyDNQUlQK/FQlNmgdywJOVcPLxjaOpTEdtcu+sw
	 fe2wkqM9vOjNiDllhNpdIGxiU5CKYY0VpcKvvuXqvKQYQMpFXsb5jsfyMRq7f5u4SYiQy
	 7UqqOVT8y3ur5TTn3Ew7mWb4fif0+BsimWqgG2UytCdstzbJTlNv/3kY6J2PgKUfhv8GZ
	 YJIPJqt7b+JyC+cW25+alOoUwnN5yvtAYKD2mGVFp8Es9zPxhsf5nk4ZlcxKk0A+3Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe2bngzq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714A606E203
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe2bngzq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B5C1F000C9
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592207;
	bh=EU1uYM/NmLFZaI8ig83tMQonoDZ93Lw71raJgl086sU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Oe2bngzq4C8gbD+i78EHwnVvNOgsuhw774fp5I4cEfe8PABs/x8esZV2Mm3DBh76r
	 DeA2YUqWAJRoY5OBi0zbUJrroJ5+FutHwPbhSZzRhU8pNPSdMVtxnbOo3yzPU/aMD/
	 b1kKzTSO6SI2Cge1RcTLVBA99PSYmbYGCbYQRW5l8MY1wZjud8QKAn8oylC2yHl99w
	 Pc/9D3RfR157Mt8HtqMWkIFF6zUen49Mg+c+bHYKOTyqVYbyeldb7wCmUEBF5i7ScA
	 FLLN55pbrEN+/NF5uP8/4Lgna+eWR5gcNKpde3XlAl0e0arWd/buXECd8KUQUoKMu2
	 Pzv/mNxLeayig==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c08539c827so1335533e87.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 09:50:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFBNJc5Wsuaty/lUsyPzbg8K8Yi7LURBSWpxzZX47myJEZBq/TZPaX0yseBMuiKHKYn2qyAeANY4ZSXow==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6JaPrNS8fsrIvMB3Nas8gidM+8f5/sC5n5CPPSrky8xicp29v
	dm7Ni6IuOkv/F1eLkfcz/o3GbKkX9sAbMSQ+Nkb6NqTh5N/peXSAE2Nwl6m0St9TFBOeS/rSG8q
	ufzKsACYdaGSFmh0ajP3ekEN5QRWlsB8=
X-Received: by 2002:ac2:5683:0:b0:5bf:dd04:8d7f with SMTP id
 2adb3069b0e04-5c17075c348mr1704210e87.11.1794592206322; Fri, 13 Nov 2026
 09:50:06 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-9-johan@kernel.org>
In-Reply-To: <20261110085125.2535508-9-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 18:49:54 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g+X0etuZSoTrFr2OXgF9o0q+LLLTcQSfvo0A3dib9M4Q@mail.gmail.com>
X-Gm-Features: AclHuK8FkWmm3X6Ez4fQpYts4d02b-gmJ11NIGOgqEPyiws4gYW8Iu7-IoWq1Cs
Message-ID: <CAJZ5v0g+X0etuZSoTrFr2OXgF9o0q+LLLTcQSfvo0A3dib9M4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] device property: fix fwnode_get_next_child_node() comments
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> The parent pointer in fwnode_get_next_child_node() may not point to a
> primary firmware node so update the comments to reflect that.
>
> While add it, fix an indefinite article in an earlier comment.

s/While add/While at/

> Fixes: 190069255582 ("device property: fix infinite loop in fwnode_for_ea=
ch_child_node()")
> Cc: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/base/property.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 51109794d727..32df0c6724ac 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -810,7 +810,7 @@ fwnode_get_next_child_node(const struct fwnode_handle=
 *fwnode,
>
>         /*
>          * If this function is in a loop and the previous iteration retur=
ned
> -        * an child from fwnode->secondary, then we need to use the secon=
dary
> +        * a child from fwnode->secondary, then we need to use the second=
ary
>          * as parent rather than @fwnode.
>          */
>         if (child) {
> @@ -822,12 +822,12 @@ fwnode_get_next_child_node(const struct fwnode_hand=
le *fwnode,
>         if (IS_ERR_OR_NULL(parent))
>                 return NULL;
>
> -       /* Try to find a child in primary fwnode */
> +       /* Try to find a child in parent */

I'm not sure if this comment is still useful after the change, so
maybe drop it altogether?

>         next =3D fwnode_call_ptr_op(parent, get_next_child_node, child);
>         if (next)
>                 return next;
>
> -       /* When no more children in primary, continue with secondary */
> +       /* When no more children in parent, continue with any secondary *=
/

What about

  /* Direct children exhausted, go to secondary */

>         return fwnode_get_next_child_node(parent->secondary, NULL);
>  }
>  EXPORT_SYMBOL_GPL(fwnode_get_next_child_node);
> --
