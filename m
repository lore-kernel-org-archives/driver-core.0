Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932496;
	b=4dBhlEk1CBAwqX+T4SK4O3fAYlDUiQvYFRTntrUFmKh7JPGt/ijZeAg1ZkhUyoTzcFu1
	 wi/hZy3GId7oyZxBk/GhgXy/0R6KLGZjF/noDcw8YTop4etcPfVE71BPdyY89QV/y1Qmr
	 z5DbQ2pBc9CLaZ/4momrSkWS59I7yPkp3Ef8j6hdc6mCPyA9gcTUggvVXRzB4kdfSiIKP
	 WdEUEGGugh9Sn4tvnwajncB4isgwZRmodv7aiT1UW4K3DF5goWUQrKsvqyRUggnscs8BZ
	 YtxrJqrjFkYGhaUkaQs1h152bGwf9bL5kFpHZZqcOro5nRN/5VaKdUR7/w+2ucQkAVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
	b=gT3QxuT7PMB/lpWusXCmN2hou/68bJSH/fFdFpKyHCQnZWPfRvnWeoeXNVjpvZogqz3D
	 G7Hn9az/Xry4CfmDJmjRgStpyRxvN6WXwth1MzFOnGEj6wJDtu6ETTWSWEiID1iBBKaxD
	 FK4DzucSPxnxXNA9DKTwRGhRpGEwE8f65NZIsE6Ed/eFSzCyw1zhj5AP5YnXZUyjThM+b
	 /sScVvwc4CBnj5OKsqYp5n54UNeSLrbT2x739BRWOPWX8m3rF+ZlNfbOa/qzTV1KqimlL
	 Ci/cDrbMtedg/IV8B364F1gZUKydi67ePLnHMcm9Wx8THCiVPYYOsXwSXb8KJ0ahweg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9E606A31B
	for <driver-core@lists.linux.dev>; Sun, 25 Oct 2026 12:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A9E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9334925e9.2
        for <driver-core@lists.linux.dev>; Sun, 25 Oct 2026 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792932488; x=1793537288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=gVM3K9ErZAp/EkeEeltwTaoA5pX5dS5FPKQK3qDmIkzDJY3O0K4eQcyWdAGG2GdiBW
         HN/LxLJNvncIkmTRwEdK4mu8X+r3cDnuBKGndGnfnIZ2Qd3oHUPBm1Y+JRCCl7BkFsCt
         q39TgHURfcijwvt9QZLcARpTpFQZPZkgDiZGHgkbekHU6M76HvQI4yCO+MPS4XKtKq1u
         En6VGsY8fRLQvJ3SYGYV6VBkLbN9x0icNw1Aj3E3JyDpGb2nu3IbYVwHX45gIqzORSwT
         SeaQktVzbQczJBSugJAq3K1HMm30JCKFYRXvPbx7ofg9kQDgYvhUDDEj+Tjw/FSTxVl/
         bztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932488; x=1793537288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=LWu4vFuJDI3lJPYOIM7CKbkj+6Vprpw3PYfviSjvl7E5MhYCY4bkQWhnYiEd4dyKnu
         etG86PWGc3VGhLwxlsFp9eT/hD7D/fPTUM8nB4OUXKp90rC3AlqtM8bK9T5pxQ0KtvVT
         sAhxYwTWoKpYNCmFppsn54lyBFTLepM1FL8GEmVJqtvUefAXZYorprBAtPIoXp6zVm1J
         Qdxf0za8jy51dgllJv+CvjsA1Cv1q5/Q7Z82oVpzVQ2CAbrVqoPlcozM/qSDeERwRMQG
         F/aAlwirN0EVpcm+lCDj7Dc4kq/rXr+p70MuIGl/gheJbq2ZEbutlz2FRNBoECTmZjhE
         k5qA==
X-Forwarded-Encrypted: i=1; AKwUvByd8Re19ACcHaag/yRPQADQxGcSehiU58Y2/GqP9me/sY1ttuDJV1ZuP/NYbXkunmRHeWz2IeUM2JiiCQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKvEL5r0FCFIZtD+WvbJGTdZqk99pGcqJbaObxfuucB1OHx1kMx
	ZGX679IFS8U2nDnReazEblFpipDCtlQ4Pq8wvaNMv6KwEL5+JekVQ/1mRFThKFbzSRg=
X-Gm-Gg: AYBFou11wSaw73O8StmrWyAEP7uITxejIpyIn9lnGay8+iOh7kDbHPCZCaXT7sbOxtf
	Hob93/c4sjAONonNNWV0JB4T4lnQ9HR6wSMWTEoziHTLWPvSLCbjHLNNFeSGl6r6cqwaLizDw4i
	NX4Zg7DSqdK+KjuUkV9019nqc3kBDbSoOi8uq1uhP0fNCrTFnhS7jr8QpSv6xo+hGfEu0AgXps9
	PFQIW3Sga/j5WuWk2jHuB7IeF1boo0yqbBwQf1o17sbwny86mpLCsPpahl54qDGuT5uMKX94efa
	epZzU8i9G+4hVtLBG/ODkhRLjFhm2DPimwmMIZEnU+zOGAboVVfgvaqYZoOmDWc3XdEiAgWpvyj
	rVgol/oQZwa8sfrjewqmcpAaWcV60jZmnlRAf1UeQj6nD/sysM1FgkI9+gvF+bWt38bpLKMlTH/
	bDnlSulu8kPq5wEUA9Exy325mMe0U10eXc89wcEjdYBn4e5V4WNDMR9UMdkVgCw6Pi9zeyTW5gC
	5558qCvcxFZTLHT7Zpx56WlWLroAsz9+qYF3anpK8agATJyEthSJeJQHc6CZWMEek/t1BcoUzNW
	/OL1sg==
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr71714575e9.18.1792932488137;
        Sun, 25 Oct 2026 05:48:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a04ad39sm326937255e9.1.2026.10.25.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:48:06 -0700 (PDT)
Date: Sun, 25 Oct 2026 13:48:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>, 
	David Lechner <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Thierry Reding <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <at34UOuYv3NtX36R@monoceros>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hexcezj4rledtjd3"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--hexcezj4rledtjd3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> So what is the real use case here, taking any type of any device and
> thinking you can bind a random kernel driver to it and it will work ok?
> You all have specific platform and pci vfio drivers, why not use the
> proper device ids there instead, or better yet, bake-in this type of
> functionality into the bus-specific logic so that you can have generic
> userspace control of a device (like usbfs and uio does today)?

Also note that even if the platform and pci busses implement
bus-specific code to pass a given device to userspace and/or a VM, you
need proper unbind support in the driver currently managing the device
(or cripple the mechanism to only work for devices that were not bound
to a host driver before).

The more I think about this taint, the more I believe the commit should
be reverted and replaced by a some stop gaps for driver_override. (Be it
a taint or better yet
https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com/
.)

Best regards
Uwe

--hexcezj4rledtjd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrd+oIACgkQj4D7WH0S
/k6aewf/a1J79AfBUwvrOd6Ba/0Y7Snc6nW1R3bcrJe5+V181tlQ+NubUnz+DJdu
l8Jqw1xcQaALmyYYZ+CaEenSacHj9TFNREGi92ZjNkN8m6+iH5soIV1vTHPZaevX
R9oV4vf5RnsRXugZv92lNktCGbzbu2ceTDhJU4IoX5FyuqL95AVajJ4awrTw+nol
Y+gyqcgb8mzONrS7D52rBINMIjpn9/nmcPs4bVkXCZjAvPg+MFRZTpjwZ7hB3Guo
GM19dH/Q7rfMakDFZ/TJqgDbxuKHrPdU/EFkrRXiolTo+VEKvUOmiiW/JK6zrFH9
WNnJHHFnJdcfBwsazk9IIqGimnpBHQ==
=zFX2
-----END PGP SIGNATURE-----

--hexcezj4rledtjd3--
