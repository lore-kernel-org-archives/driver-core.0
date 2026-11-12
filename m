Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522672;
	b=IlXSbrMDNpLBWARMHr8I/nUNZa5jzfMRTfiOaYw9f+zxEwD6IyyLUEHBM7LyCTUP0UQM
	 7XqW/Vatnes+Ol+g+zachTT6VUDANkYXT9fwBNjU8uv2+5GO1yVzewptIRjq2VvR9gy63
	 pvL9TZotUrYBaRMfzd2FepMNouTmYJmXjzKbufn9En2C3S3J+bhLsPXt2t8bMMjARDIOS
	 9VfJI/GJm1L8PW1CxF19GcBrdDd7Vijn9ivMiRC7wNxhpUxXLbOYNlj2qtvtch/yRS7u7
	 6ZvlkmUGMTQQ+I3OZYCe6SYMISqCWzdE0k8G90DlGBWrvUVP/R+aLR22GivouJ6nOfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+JTSqev9V+WnU5MiL+EzLENGXn9aXmam81GQLiwSL0o=;
	b=1uX8la3Zywj2vPeAw8SrjTYjdJQCXI4N6erKbbmukagMriVZWHmZldG6Zc4BjOa/2e1y
	 a6sGW1zElD5Izt6eSWkRVxKgtAl+rr0GzRSgZmh4lyUbFIK2u/hcAe19yKlbKVY0M4VBh
	 RNO6WFW0uFJv/LP7UZRLWUONhk0YkUR/fjflIwEok5jiShhxWF6es/D5n8jAMEPwaCnxV
	 9NUCgqmcIO8fEVpk1FQOJOe2/2kjfumaCrL48UyzZ/DCAC/tuJt+NXgxBgE72k5JyYORT
	 ZVh2xgMxCrDNTdPqEe3G8xEkeOPbGvtpRPDgMFG5mZWDC89BvYU01xp0/BoilE+osvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYcB6hyX;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5D6606A31C
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 22:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYcB6hyX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1883125e9.3
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794522670; x=1795127470; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JTSqev9V+WnU5MiL+EzLENGXn9aXmam81GQLiwSL0o=;
        b=RYcB6hyX9kjpGVLJ5YykqQPL6xAmCzrNBWIAjSSz2VAU+TMjCPyxOjTh8x/JA23PD6
         zV3a9Y/BT6k6Bk7N3Unkl9WcRfpCzuwq3wyk4rIRh6ulj63ToG1urqPNB8gEVp190Ayk
         yj5uNc2Ib6RzX5q6tvfArEiN+tXiQNf5LoDKePSJpvym3pIkCWoVCAk4EdIbgHC49QBv
         8uCcCyws1TzvCDGXg26ARVOoHaln9s46ARO+6cmDuxibikVE6qDmWhE98kNWqklTEFxU
         ntTIfLLNQlOMK2qN9ZuBRsi4EWEJ5X1UIrwMSBcN+HGXdcIQflOK5+nCYeRMpm9mdxCr
         D0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522670; x=1795127470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JTSqev9V+WnU5MiL+EzLENGXn9aXmam81GQLiwSL0o=;
        b=saALZxDEg7MmqxFh0v2ryb+SXaeoYin6ZzwsPyBKta2BmMRzLpbCrvrPV6Uk2eBjbt
         TKOukBKHuIQqpQ1fDoQWdcW9ZHED2J7DwZu4arhmp8TxMVdlkoFt2lpyZRCqr11nvLsS
         l5MVh6ZUEnhYXj27P0LlA3b2SEoWdowRFs6mGeTTFpBEbr7kV8zp3JJYkKch4uXJ5vzW
         qoh0i/uagnRdxZYyXWXy25Uz6AfsBgQbRas394RW2ZSrMCYEpQZCfEiLHqIVcu/AUtKT
         63ilKireesvph4BgfKcFDjh4PxAg/zPzuHC3Cpo9C6OiejGnXnrJEdyuT6yVCNFcgavX
         5R2w==
X-Forwarded-Encrypted: i=1; AL+hErHuouyeSH6H+JPmwRmcyCNHVhDZMbiBWf/Bs2hS5S815fa75pfKLWrg3jaE10fjbRILg1MDYLy4iLfEyg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/n4RYMvMeRMHJBk2LNYguKStlhE2/vIk1OH04+yb+1raAz+qIm
	oxkLnH0PkDRuxwPYEUke1ZMvjZ6mrt6GfRqdcpVmsiEnxLxPvjS7YRHZ
X-Gm-Gg: AYBFou1icsu221WvhWlEOeJ5o1eW18ORaE6VOxnL1Hzk7/ZmZNQPuMAZ2TjQb5dNTFf
	HpZ+hFfLMwevuwLBGq70gTajtkhE/QmUOAnEz6L34Q+MxodpRI92ZBiP49wviM/sghKsE1C0zX8
	MyY4/L8OkytTcddZBazbfjRnlfO0Di9Y7jdU3UMIZBrSYRwIXsXSViwRgXrGDK5h6t1BUs65ZDm
	WrrIYm1mYMrpCISD+dO1wz24OzSYG0S/h1GVyIJD05l/tBTV6MKfDoxoJdxDQFr28uUyMfrB7gL
	DMWi7sw7dxKat6MzNhdVmpYczmfNf9uBsolk/+fSEc1jw/Av3m0aosGJVw4QVWVBrhgd7RCCOdn
	XzAOTv39bfsmzJ4y+pEeAxTsgpeTX8faImKCzGkjVhfhD7oc6XObJ2fWA6qDkfm5PZzJec9iSdX
	obQZffnvVzftAmZwFLi3kPmtIBQywD+O3ojmlK+csv8kbekx5S/TSqGogdV2CKfsKA28YHHxk+2
	mGJZXMZH8Rni9/tG/e4f5hPPb+8QoT0HiCAN0oFQYxeLsp9+xy4ZaAs4IDFUfrMZ07wPkxg5ksn
	jQMq4/JKP+t4jhIIMVyCFM34yZe23mtNv9yIpx6+yuVXJXqDLwMZvxH1VSkUglQ0Bg==
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb55abbadamr13368985e9.31.1794522670201;
        Thu, 12 Nov 2026 14:31:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720e9c2sm42715e9.3.2026.11.12.14.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:31:09 -0800 (PST)
Date: Thu, 12 Nov 2026 22:31:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Johan
 Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] string: Add strprefix(), and deprecate
 str_has_prefix()
Message-ID: <20261112223107.3a9efb85@pumpkin>
In-Reply-To: <a74fabd985a874da7556ae1601053b4bcc100f13.1794425425.git.alx@kernel.org>
References: <cover.1794425425.git.alx@kernel.org>
	<a74fabd985a874da7556ae1601053b4bcc100f13.1794425425.git.alx@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 20:55:15 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> As Bartosz reported, str_has_prefix() has a bug: it can't differentiate
> between an empty prefix matching an empty string from a non-matching
> prefix.  This is a fundamental design flaw in this API, and not
> something that can be fixed.
> 
> As always, this is a consequence of choosing sizes instead of pointers.
> Sizes are often the wrong choice.  In this specific case, pointers are
> more capable of differentiating these cases, as NULL is a special
> sentinel value that doesn't need to overload a valid value.
> 
> Let's implement strprefix(), a function that returns a pointer
> right after the prefix if found, and a null pointer if not found.
> 
> We'll slowly migrate existing code from str_has_prefix() to strprefix().
> 
> Move the description from str_has_prefix(), and describe
> str_has_prefix() by comparing it to strprefix().
> 
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Link: https://lore.kernel.org/linux-hardening/20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com/
> Cc: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h   | 28 +++++++++++++++++++++++-----
>  lib/tests/string_kunit.c |  9 +++++++++
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 6cb5cdd01158..d08ca10c39a2 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -545,16 +545,34 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
>  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
>  })
>  
> +/**
> + * strprefix - string prefix
> + * @s: The string to be tested
> + * @prefix: The string to see if @s starts with
> + *
> + * A common way to test a prefix of a string is to do:
> + *  strncmp(s, prefix, sizeof(prefix) - 1)
> + *
> + * But this can lead to bugs due to typos, or if prefix is a pointer
> + * and not a constant.  Instead use strprefix().
> + *
> + * Returns:
> + * *  @s+strlen(@prefix) if @s starts with @prefix
> + * *  NULL if @s does not start with @prefix
> + */
> +static inline char *strprefix(const char *s, const char *prefix)
> +{
> +	size_t len = strlen(prefix);
> +	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;
> +}

I suspect this would be better as a real function.
Possibly even just a simple loop rather than based on calls to
both strlen and strncmp().
(Even if the strelen() is mostly a compile-time constant.)

Something like:
#undef strprefix // Or put it the name in ()
const char *strprefix(const char *s, const char *prefix)
{
	do {
		if (!*s)
			return *p ? NULL : s;
	} while (*s++ == *p++);
	return p[-1] ? NULL : s - 1;
}

And in the header:
const char *strprefix(const char *s, const char *prefix);
#define strprefix(s, p) ((typeof(s))strprefix(s, p))

David

> +
>  /**
>   * str_has_prefix - Test if a string has a given prefix
>   * @str: The string to test
>   * @prefix: The string to see if @str starts with
>   *
> - * A common way to test a prefix of a string is to do:
> - *  strncmp(str, prefix, sizeof(prefix) - 1)
> - *
> - * But this can lead to bugs due to typos, or if prefix is a pointer
> - * and not a constant. Instead use str_has_prefix().
> + * This is similar to strprefix(), but returns an offset instead of
> + * a pointer.
>   *
>   * Returns:
>   * * strlen(@prefix) if @str starts with @prefix
> diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
> index 0819ace5b027..73d2614b1474 100644
> --- a/lib/tests/string_kunit.c
> +++ b/lib/tests/string_kunit.c
> @@ -287,6 +287,14 @@ static void string_test_strspn(struct kunit *test)
>  	}
>  }
>  
> +static void string_test_strprefix(struct kunit *test)
> +{
> +	KUNIT_ASSERT_EQ(test, 0, strcmp(strprefix("foobar", "foo"), "bar"));
> +	KUNIT_ASSERT_EQ(test, 0, strcmp(strprefix("foobar", ""), "foobar"));
> +	KUNIT_ASSERT_EQ(test, 0, strcmp(strprefix("foobar", "foobar"), ""));
> +	KUNIT_ASSERT_NULL(test, strprefix("foobar", "bar"));
> +}
> +
>  static char strcmp_buffer1[STRCMP_LARGE_BUF_LEN];
>  static char strcmp_buffer2[STRCMP_LARGE_BUF_LEN];
>  
> @@ -891,6 +899,7 @@ static struct kunit_case string_test_cases[] = {
>  	KUNIT_CASE(string_test_strnchr),
>  	KUNIT_CASE(string_test_strrchr),
>  	KUNIT_CASE(string_test_strspn),
> +	KUNIT_CASE(string_test_strprefix),
>  	KUNIT_CASE(string_test_strcmp),
>  	KUNIT_CASE(string_test_strcmp_long_strings),
>  	KUNIT_CASE(string_test_strncmp),

