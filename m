Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295561;
	b=pCLfQ+r/4SO8dwlzwKlC2ZcYbGV1hB2jAW+QN0bL91y8xlActptl3YwcoX0u7LoNVtF4
	 gSaqaJmR2ptxC6u5sEVU+73TWukVGBCv83RfRbP40ayVHWS6c5lcsPtfxIjr4JxdrElq7
	 5QGm2hkWMiGlWZ1waa3f9YXZmWcI5FyFS2XBxwo8sp2VfrzJla6D0dybGixASWWsQ9uUI
	 hN48c5N8Co3IwR2SE97ze/UTrCuhcABGT3H71NsffT5STfAoCUOhCEw4cmrajp6AnYm+M
	 /+3YNoNca/+xT+0nwAAZkhzjVLa1F5I6J/bI0yoMWY+B/KUzJvhxseCL3n9VYpYY3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
	b=Wz30NUlEsI7zevu3p5g69egSYpqnu6Os+HxjmpmYxqF24qvNby91eR7/tZt7lcghr/ZC
	 mNeKDfp2jFaZWWzEgcJEaD96JJs+3trEvVlA0sK87NQxON8TRRsy0t+tAaxSgiZ0L6xn1
	 L+Fue8oJBrtJaqqW3mtjUr5JIiKqtNI0lXYHfEqDtoxyFheWMR5ld0QU3zrOqp8ZgT6CW
	 /oqu1io5QgGdRYZRhvbkVKNGJdb6zG+fD1F4eZgvK5duOwkKuAdIpnvqja/nmlLnt4C8B
	 zQz4y3015H0K8EjZ8cl7mGtDk3qjrMXZbpU7iS0qjOtNUIJ/n3qtxKOz/S9g+9mgf0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iH0CDtDo;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE23606A31A
	for <driver-core@lists.linux.dev>; Thu, 29 Oct 2026 17:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iH0CDtDo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17315325e9.0
        for <driver-core@lists.linux.dev>; Thu, 29 Oct 2026 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793295558; x=1793900358; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
        b=iH0CDtDoN02rQy5VXnf+FXR5ZGyw/kUraqAtB5uMKp0iqx0iWkzohU4H+ZC3NtEG2P
         pfH+ZAYvzjyhSF9nxl7bu59bF6scNQBzEBr5c27+9DZ8VQP1xpOxftdqJR7mh3f3sHlq
         geasfp45s0a38URLTmphCWDgXlV83zAKeNNMm9ea0lta3g7nvIh3D0lOvYxharAhKwhS
         VFagpq+PMuPXobKhSZun5nHJBB7gmyL/J7+FNx6ohlsBPV2XHnKUw/vC6PnGEMFEKGY+
         OH0m6p8EaZ9Mcqj1k2OZ460DI033zX6eaBaFwzJHOjQpUgHJ3V6/0TXTJsAOBoLYpAvg
         CvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295559; x=1793900359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
        b=y1FC0715l2BTOHhQjpVUfLuft+ILxpQIXcbTS1LM9JD/SrlDNl7wtMU93eUdtLQrra
         /fvFKJSvig52mtPIznxph/cJv3ZSmJaG/qal9Q7wF6ZmbM7DUftCrHOrWz7wg+69UtR+
         mwv672O7KpBGpMFJQCMjqiDR8Y4hm0Ozs4BS8yBvZ05PMv+sELCG+9qWuW0GLksgtYqQ
         bnf+fjEQsdnmkfpLTKxIeoina/bVb2rdunxN3wc5kPu3/6N0ci291MG78jF/yOH8vvcZ
         OG7UNS5onuz/jeEZB6Ud0iBH8qF3M33aKRPb3FxrVdPEo0gpbM7t5OoczALr4yuUpk86
         iKYg==
X-Forwarded-Encrypted: i=1; AKwUvBy/1qn1/rTT1/kTaN5LoeQ60Q4H2t/ocI1gk8M4FvOYDbM7k6HB/BQbkQ6qPgRh0R304jGx/VvF1FbbFQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLQrJ35ifkrVEZg4EJbfNfzwNWUhBCGVA2nZl9kRcMT5G7GqU1A
	xssxGc6TsU4eBArapEnchDAxRZxS2bSb9SXR2ZQep6p87NSueV8GL1Q0FOsC/33QB60=
X-Gm-Gg: AYBFou1/yCqSSX+Hwpq+e1kL+0AVPHq3plaOnJqwVIk8Zm6WNSIz9thkS0dPN4vmnDu
	0uSoUhVfJM9XNZmvsPdfXvbVj+JwoevGcvE2kciQdwTiils0WUvaaOOY7fcGp3i1RALsa7eKbKx
	Y9OsG9HRmrDe0dzfX9YqOvzwLTfN8OTFpBAx2dBVajsargGW7S2ekomycri10E8h34DJWixObUH
	NfAB02jQVTqJO/qPW2Yr/1+S1s+a8L8a9ggXog6nTb7CO5pTT6VplEjpcIL+B1TEl1wLJ1kDxYA
	B2OXTzSRqzyF5RD7SjyMZ06U2eoI942RyAFtMChSzLgsJP2NTzIGkuZHjULUed/tlFRvrD76haA
	Z6g0j0tjVm2ky7a+/r+hi8VtXMSzPgc1HP1jSiUH5wkGaWlRrQDXGCDwkwQJJH21D22m/Se5Lwy
	hLKIoeqMTmCs/dNO7xMJR8mvwEQyxCklgM2HzuAaxk0lK5Az9v2MWvwt9vJDUq+XFHT+3rD/jV0
	DG7xY+8gasyNaDSUPN20U/khijCz9I9faXXTVpMqkFXjb+iuiFzOIr0eni8OY+vQZ9IP9ApjfZl
	S8edBJQztz018mkjic5WtRBEXlmaTxYgnaw=
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr135986785e9.10.1793295558589;
        Thu, 29 Oct 2026 10:39:18 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e6df1e458sm627445f8f.5.2026.10.29.10.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:39:17 -0700 (PDT)
Date: Thu, 29 Oct 2026 18:39:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
Message-ID: <auODHyLrfQylISX2@monoceros>
References: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>
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
	protocol="application/pgp-signature"; boundary="l6fyrt6fnoykrkwe"
Content-Disposition: inline
In-Reply-To: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>


--l6fyrt6fnoykrkwe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 02:42:15PM +0100, Greg Kroah-Hartman wrote:
> This reverts commit fcbfaffee51a452cc8efcbaa3b88ec4595678424.
>=20
> Turns out that vfio is a crazy beast and people have been "relying" on
> the bind/unbind debugging feature as a way to handle passing through
> devices to guest instances.  Because of this (https://xkcd.com/1172/),
> let's revert the feature for now until we can figure out a more agreable
> way to handle this such that normal workflows do not taint the kernel.
>=20
> Odds are something like what Uwe proposes at:
> 	https://lore.kernel.org/lkml/cover.1790612298.git.u.kleine-koenig@baylib=
re.com/
> will be the best way forward and will be revisited after for after 7.4.
>=20
> The feature was originally intended to stem the flow of unnecessary
> fuzzing reports of "broken" drivers where random devices were being
> bound to random drivers and of course things were going wrong.  The main
> syzbot tool is now not doing this anymore, and hopefully no one else
> starts it up again (but in this madness of LLMs these days, you can't be
> sure.)
>=20
> Thanks to everyone for telling me just how wrong I was to implement
> this, I appreciated the feedback :)
>=20
> Link: https://lore.kernel.org/all/DLIL9H50MALI.3JROXYEEUM3KU@kernel.org/
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> To: Randy Dunlap <rdunlap@infradead.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Johan Hovold <johan@kernel.org>
> To: Steven Rostedt <rostedt@goodmis.org>
> To: Masami Hiramatsu <mhiramat@kernel.org>
> To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> Reported-by: Michal Pecio <michal.pecio@gmail.com>
> Reported-by: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/admin-guide/tainted-kernels.rst | 52 +++++++++++++--------=
------
>  drivers/base/bus.c                            |  3 --
>  include/linux/panic.h                         |  3 +-
>  include/trace/events/module.h                 |  3 +-
>  kernel/panic.c                                |  5 ++-
>  tools/debugging/kernel-chktaint               |  8 -----
>  6 files changed, 28 insertions(+), 46 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentatio=
n/admin-guide/tainted-kernels.rst
> index a208811ad525..3d312bc17942 100644
> --- a/Documentation/admin-guide/tainted-kernels.rst
> +++ b/Documentation/admin-guide/tainted-kernels.rst

It's not part of commit fcbfaffee51a452cc8efcbaa3b88ec4595678424, but
conceptually we need=20

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/=
admin-guide/tainted-kernels.rst
index 3d312bc17942..fcb8b9734548 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to th=
e aforementioned
 script, but if you need something quick you can use this shell command to =
check
 which bits are set::
=20
-	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i=
&1));done
+	$ for i in $(seq 0 19); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i=
&1));done
=20
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

in this change which was fixed in commit f1850e443b0e ("docs:
admin-guide: Handle TAINT_FORCED_BIND when parsing
/proc/sys/kernel/tainted"), but that commit shouldn't be reverted as it
contains a simplification that we should keep.

Best regards
Uwe

--l6fyrt6fnoykrkwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrjhMEACgkQj4D7WH0S
/k7pjQf/fZLeX4jg8q6vdwBmv7dGxKbev3ARRZTtVOacOQwftIek8l6UKQWlMwoG
/tiokVc22lkSxsHq47w6eKUKpucHydGzT8Y7OZvHNjOjZ1o9WS00lJRh6uhVTh06
MK6k0za6dBbrOWnTBeTGZuWlLCOQKpDB/6t93V1fIYYJSd0ir3GpvVZzfM16Pk0d
opyBimIxlfjCuxzRbj7DZjzv0I5PbjXdox41VKx2cx60OzFJdN0MKZifLp9yNV4s
s6Tc4Q1oK/Ih66hhbojNkTp6Xyzsy2m0lvku9N0DitT5/VXqoI/mdedlPK7tFWeh
qZAoONEgzf9TmSM0/P2g0K+1mpLkrg==
=/byF
-----END PGP SIGNATURE-----

--l6fyrt6fnoykrkwe--
