Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A92FB969;
	Fri, 26 Jun 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472414; cv=none; b=RGb6UAbZ8gk7kMH3RHi2XSxVHcSapz0qQb57OP7lBupQe4k38tzCh7GJvgKpL3mZXWbLYd7S22nkjHLUcC6t7g7WV6PPnNH0QZYGdC2uXlPZZvEXu4xcFC32QnENpYcASPuPdkHkokQO/2aA58o0jGV7Q6ZOHftVhm4BcaAv+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472414; c=relaxed/simple;
	bh=05h3gb3qFZedKidXtONi8adKBXa+tBF07k5fLzNX0XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2BaLBRn2qqTL+smAEgEbe2g3Nnzjc6b6RhTeeH+KTS6nppXzHcGXXw0uPO8QyRWoIoJuCEsoh7FJ1snBuYLf4gRsgu6r9M2dd9UiM5JwK4FZq7p5BsrX2PYtI9Ny9bK6rhxB20i+cuazz6yzceRduznRlWHlMNSnFEsioMPqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1E4qfyD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1E4qfyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7411F000E9;
	Fri, 26 Jun 2026 11:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782472412;
	bh=LzfUnkQD8oHUac8YmqY+/bMstxHonwhG6Z2gmTwYSWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y1E4qfyDYRvmUFuhuZWJ9/V2yaJ5yAMcAFiSU2mNe/i8qN7KDc0QFS0LFeLuX6rfg
	 OpkydWISkfHFsmSTROpmhVbP7jKOXhDWRSoAXpIi7mmmMQSiJYDNibz7MZPRx1YMNL
	 tTg4U/rVZ7CQSMs/SxI8VuHv5bPexEvS38MPJVYh41APEkVTixeT9rkky2tgwC5Qan
	 x0PrEMM8f4Xj+fdNXIeRn6LtVkybq2a+KG+qRiK0yPg46PmF9YAUO2VKs0fpewtFXs
	 BXVEfTXOEvU7OAJR7rzj7kWtTRfL+vdEP3msPibT/AuDNkIsil+wrMecRwXFTvE8+V
	 96OmruLPW+Z5w==
From: William Breathitt Gray <wbg@kernel.org>
To: Syed Nayyar Waris <syednwaris@gmail.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isa: refactor code to remove nested blocks
Date: Fri, 26 Jun 2026 20:13:26 +0900
Message-ID: <20260626111327.266079-1-wbg@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624121027.GA79357@syednwaris>
References: <20260624121027.GA79357@syednwaris>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559; i=wbg@kernel.org; h=from:subject; bh=05h3gb3qFZedKidXtONi8adKBXa+tBF07k5fLzNX0XM=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFl2caeFFS+ey9h0ad2D3X9Wdp68srgqza3wxfUAV6vrE 1fOO64v31HKwiDGxSArpsjSa3727oNLqho/XszfBjOHlQlkCAMXpwBMpHMrI8NW5vMtmTOl5bUY n/2wCZj0e9+0SXI1JQ+/i6Xs41E75BTP8D9/XahFctIn4+tdvL7Gbzl0FWb+V/uQqstqY7W6oXn qbx4A
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Wed, Jun 24, 2026 at 05:50:49PM +0530, Syed Nayyar Waris wrote:
> Remove nested blocks in isa_bus_init()
> 
> Suggested-by: William Breathitt Gray <wbg@kernel.org>
> Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>

Hi Syed,

The patch description is just repeating the subject line. Instead, you
should explain why this cleanup improves the module (e.g. makes the code
clearer).

You should also include a Link tag pointing to the previous discussion
about this change.

Link: https://lore.kernel.org/all/20260504063518.515620-1-wbg@kernel.org/

Regardless, I agree with the code changes in this patch so here is my
Ack.

Acked-by: William Breathitt Gray <wbg@kernel.org>

> ---
>  drivers/base/isa.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/isa.c b/drivers/base/isa.c
> index 5887e4211f80..4e9f68080f39 100644
> --- a/drivers/base/isa.c
> +++ b/drivers/base/isa.c
> @@ -166,14 +166,16 @@ static int __init isa_bus_init(void)
>  	int error;
> 
>  	error = bus_register(&isa_bus_type);
> -	if (!error) {
> -		isa_bus = root_device_register("isa");
> -		if (IS_ERR(isa_bus)) {
> -			error = PTR_ERR(isa_bus);
> -			bus_unregister(&isa_bus_type);
> -		}
> +	if (error)
> +		return error;
> +
> +	isa_bus = root_device_register("isa");
> +	if (IS_ERR(isa_bus)) {
> +		bus_unregister(&isa_bus_type);
> +		return PTR_ERR(isa_bus);
>  	}
> -	return error;
> +
> +	return 0;
>  }
> 
>  postcore_initcall(isa_bus_init);
> --
> 2.25.1
> 
