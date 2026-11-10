Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328375;
	b=Cg6r0UtQR0UJiiVu0XAUq2Fu13QhaIkcykrfFdoyMqR1o8TWm3FrNWLXOjXz7At+Tfle
	 oYsyMDBxWyS8+ICeVOoyaAC5IcqJzbBE/31pqBdqB+mGp2BeVU0YNwWFQp1Q7qPdZSv4Q
	 JybmOjCduXU/hJtFB4+GbTd9uF7dHnGTqxTvpLPowMw2m3EGRgogWh3MacHmKAS3+Z+Pq
	 7NaeHukb9FP/0Rq7qIFKKPbtaV5w2EYjI3Lk8qjrL28vcpANVLaItl7GVR3QGjzef0F6V
	 V5hHmgbvdWNzT4wNsiKzATrjGB37TnPfj3toVb/Z1MGcGfMYiL9+ybI8EcEq+Cg0rBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328375;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=O7Jegl1jgTWHpCnkVKKRRzSGStNzjcqpAmRoYpUqNSo=;
	b=hsjkBOvGpoGxEASZjPGWx0Y9hOzTflbaDy73+C/Oi/OW7isqPXRDuGHXFBUpo2h3nKdQ
	 R+DI/m7FQy4Sj8liz9go/lESRhXsa4mco2V7E3Y7HlSwvR6tJP2PHRYaf8hMh3OyALILu
	 4hjhGHz/1Ias4aKVnbnVa0XKvpkaMAp1lnB1+p8DbJqiVSBol9gVBpGWL69n/2xX+K7eh
	 5xPAcreaX9QFUHddUzgXyp4r8WU84Q8NFG/93flBx+zYuarJXoqqlLyHEGQ/rLktG9X7g
	 d2Xgi+PavIg5c3uRmJt4UtiAbhMWesGzdYTefy9qJpSe/YPpD6vavfSOLPJOyG3++BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C9606A206
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 16:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2C9606A206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 0DD7E1C4341;
	Tue, 10 Nov 2026 16:32:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id EE3BD60016;
	Tue, 10 Nov 2026 16:32:41 +0000 (UTC)
Message-ID: <64aa89daf23821f95780813fe96882ff61688578.camel@perches.com>
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
From: Joe Perches <joe@perches.com>
To: Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "Maciej W. Rozycki"	
 <macro@orcam.me.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Andreas
 Schwab	 <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, Danilo
 Krummrich	 <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Johan Hovold
 <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim	 <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring	 <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan	 <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi	 <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Tue, 10 Nov 2026 08:32:41 -0800
In-Reply-To: <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	 <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: EE3BD60016
X-Stat-Signature: mp8xao1qrwddju9nzuyip8mr885n8do4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18QrhYeut7Lp9jEX7fMdRrU/x1vmS6is5s=
X-HE-Tag: 1794328361-279135
X-HE-Meta: U2FsdGVkX19mRZocbBpptel45dGmmyuITr1m5kU6f/MCdgw7zyp42Lt9p8rwk1AwtWwqvUuTXSrVbbpC+WZMCNQlScguvbF/fp8QvUKZy6bX5OrrWZVylJIK5F/uf/mP//94tQRpit19ctDzMHGmXyZHRUFZIahy7AXe+ttUOBAh8XiedqLFbcyMoZseYLv8KKb9P525JfTfeaipS3TohBcIVQOrwjl0q7sqJVCQkzab2gi2Y6fSCJY9aE/ycYkpvrssOELldVCYA/OT+QQagS8c/evSCjag8q9+FlL47GakQTWD6qMRb/yjUefhkQv+0cylqj9qmuN3Dgv6C1hQH070PEeodHlIUH5Xx5H14aAuv5AkhkMaKT8d8hNm0FHqaTzMXG236F+W/jDWUK48Bw==

On Tue, 2026-11-10 at 16:33 +0100, Alejandro Colomar wrote:

no commit description on proposed patch

> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 9e59f9697c9e..55ca4cb5122c 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, cons=
t void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> +
> +static inline char *(strprefix)(const char *s, const char *prefix)

Why introduce a new coding style?
