Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180720;
	b=V9vBcBeP/z9QKQ0ZukPazZMP0KVOwGJv4o/5llYXlK2odTGHqB8akSgWGvcl3Suie4Ue
	 t2oF57+HV9b9nuoCweveRM1SYSg7qZniQYwCxhkHxnMY3bbHnACUM4fVfE8d23jBA3Kxc
	 Qr0TnffsetEADPY6L8GH6vSkp62D+/5rp3OLGowxpxGQWritVMEk6YolTNsRdcLTYF9z9
	 l/I0thHwV7RLdu7fN1eSCmLa1uvhmeKpPE6AX0Tc5WCkxIE/n0nL2k0DRd1uoWpNiQa5i
	 4vrhbTk/LlkFcmcRx4To52Po0T4y0feT+XrVtW8RTzCvjJ2HJWps7Uizx1iZvNHRHlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180720;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ljcd7M6yImqjEDAwU6cFJxWpbKpzPiprYRyOQuuy/iI=;
	b=wWrcWamCJukGLQ5tRX7o4RvlmQcebu6M7CHc/53DYbRGaCwWUsIbvYwLDLq4I0K1Ya9S
	 Eac0aBR8ulkDJJOfDjz/KAB0857u/Xb/TWuo/mKvvUPvDWRxyUQsdof1qXpS7756aKwen
	 /SvwoiMdttnE2HWb7nKQos3gZIQNswrMCBKZVI9VOKuuMAcxoYR5OC6HkI/rb0nEzrW8Q
	 AwPy1wvkDoIlVGpjIc78eHD8sNgQ9NwBCnUX4BVaUYAqGl8NHV6iysOVC8EiAUK3PCJd2
	 N4odwj/iLufM9tpJYGNH1bq7OchzxxFfiNOcNJToTet8jISEPw7soQZCBeiFQ1crPZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8ofW76T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B5606A331
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8ofW76T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B721F000D0
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795180719;
	bh=ljcd7M6yImqjEDAwU6cFJxWpbKpzPiprYRyOQuuy/iI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j8ofW76TNHCyIAhduPWFSXBQJJN5P6JazkCwZ4QVgsNv0dWaJFuS7evLogl0IX1vE
	 2+bo+rEfwG6sK3GcRXn+fUadTwCrJh4ivQ3dbb9A71/7nT3I8AVdZdNeaHgRFDlGxB
	 SwxgJ94BWXIJ/ako4utQqGs4Cp32bSgnfiycOth33dlqgW8wb6VMlmi/XpV9A90y06
	 XsnZuP9ZlKI24isiYmYuvFLOVqqikNkdVZKLoDjqJ+YRWH9zLxINcbtyCNGk+JaplM
	 0vYdNb8jVFSw00c8yd8BUq9GAKYNmuzX7UlRbetGs5++PqfeQBAusGNzMqeYjZfpo4
	 zkzKrmIPP1XHg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso482765e87.2
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 05:18:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFgGilhb1Jlv5UfflP8SrDO1mIxU8jGgNKQv/Q6yObSYoFTsiNoPBkh6X64HPNbdmbVa10eHPDupfCvzg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9UpjG599BtZrcp8Q5jQXNl3tnyQwoUlXb3iYoNAAU1EIjLdeJ0
	zl/1YGg7QXtfd5F1xvuECfb9MDzoCsyhy78foIoUgV2EmVH+Ee8uP8gzoyUSBGAcKSZ/sMA1DDt
	L/Nem5OPUM2WbRS2PZc+fl243S/wxIJc=
X-Received: by 2002:a05:6512:23a0:b0:5c1:5d1b:9142 with SMTP id
 2adb3069b0e04-5c1bc7fb790mr1055175e87.13.1795180718037; Fri, 20 Nov 2026
 05:18:38 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116103807.736778-1-johan@kernel.org>
In-Reply-To: <20261116103807.736778-1-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 14:18:24 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jn32TL1N=PDY3v=9PL4ZJLainNUNN6ecXOJs=N0TSEjA@mail.gmail.com>
X-Gm-Features: Aa3M54qddmtVTgOBhtQ8RQ2vh_Rijwl6c0663HPppe56CfxJ2daDHJegt_Ei0u4
Message-ID: <CAJZ5v0jn32TL1N=PDY3v=9PL4ZJLainNUNN6ecXOJs=N0TSEjA@mail.gmail.com>
Subject: Re: [PATCH] software node: fix node group deregistration kernel-doc
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:38=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> Child software nodes hold a reference to their parent via kobj->parent
> so there was never any need to deregister them in any particular order.
>
> Drop the misleading kernel-doc comments which suggest that deregistering
> a parent node before a child could cause trouble.
>
> Note that parent nodes still need to be registered before their children
> or registration will fail.
>
> Fixes: fc002f0f23e2 ("media: software_node: unregister software_nodes in =
reverse order")
> Fixes: 0b8bf06f6719 ("device property: Sync descriptions of swnode array =
and group APIs")
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

LGTM

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/swnode.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 8e12f518e13f..78e224539b02 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -954,14 +954,7 @@ EXPORT_SYMBOL_GPL(software_node_register_node_group)=
;
>   * software_node_unregister_node_group - Unregister a group of software =
nodes
>   * @node_group: NULL terminated array of software node pointers to be un=
registered
>   *
> - * Unregister multiple software nodes at once. If parent pointers are se=
t up
> - * in any of the software nodes then the array **must** be ordered such =
that
> - * parents come before their children.
> - *
> - * NOTE: If you are uncertain whether the array is ordered such that
> - * parents will be unregistered before their children, it is wiser to
> - * remove the nodes individually, in the correct order (child before
> - * parent).
> + * Unregister multiple software nodes at once.
>   */
>  void software_node_unregister_node_group(const struct software_node * co=
nst *node_group)
>  {
> --
> 2.56.1
>
