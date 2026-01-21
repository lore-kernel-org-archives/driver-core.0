Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360F43DA32
	for <driver-core@lists.linux.dev>; Wed, 21 Jan 2026 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013860; cv=none; b=R5n7wMSMZ2dA0U1YfcmEV7pv1xhCVcYxodvSfcO9IncsEbFZz/mjWyD/kp+mqA0pQkT3fgLMvlhr3dbOKWFDfRmB/WDDfTCc5+J1iTghh7JuxIHsdi8PAwcUceoNwrMmj2p4wurCNAeQPvO0LLkF5yA8hXkoBvA7hNcDtbmIUN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013860; c=relaxed/simple;
	bh=RgX4FgksVcrRMf8IFUNn+O1ar7lFtWajbOexnFwiRbU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bB3ONzgaEPnZPEUhq+n1f7nc7A0oNeHQMVazOvQNJ+YPzG72+Tzea3mregsdSDrxZNl/GU4A9IyQw9Lt7psaWJa489ZgmqpIYb3s0NWeE6TQyE2RO5XLL4IBmmzjTK2GiIcqYlHE9rxKHX4DHhp4w1PXk5m88VAP3j0GhEL8R2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWQGyxFl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWQGyxFl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38305f05717so501411fa.1
        for <driver-core@lists.linux.dev>; Wed, 21 Jan 2026 08:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769013857; x=1769618657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/l5Or+9VZx9wTcwnm6b2pPtRU4tLZm9EvzdoDhgPg0=;
        b=hWQGyxFldXIYpkv/0iLYo2fT+7VjDD9xp0R7akFk4f2BvUhJg2PVQzAfV05nb3DKXI
         6rPRhC/BWS7NlyxAmH63TUZhQvaDW7kogDm4MwZFaot1L+yISfUR9WSUQSpbLpb3chHL
         F517CYYPIGhTuGKtHwv9D+OVdw5/M9feLvMmD4RhBqgi0c//my6hylustRSmrCJnt6f/
         YirTS1ZMTqtQdTGm6FKClcZru3B6S3DIxLVvqRSDNGILjVh+z1qu+CdGLmYjOn4t9IEJ
         +g+dTVHcB1eZ8MZ1rurnk4TRd1uk0RohCYQ5JpwgbWGp2TEZbdTcotfBvN6lDDSytx/c
         P7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013857; x=1769618657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/l5Or+9VZx9wTcwnm6b2pPtRU4tLZm9EvzdoDhgPg0=;
        b=jJM5f3h9zxsq6b5wslgH8LMnrMaLDIMuuGKDjs+Y63p/Xpy7GwMlC2qvFc0Di36RR6
         DUhLYrLtcjSbc2jIuYpbqQp4hnnii4ytlMMMUv6XXHsuCr3Zb9LYOlEldjllMibm4Jji
         fX9G7zJ3cSi9nRrLM+10fCel/dKJFxdi5c+TAIB472AZJx9tepuCRfgTTeaD98kh2D3M
         qScJ+eySBDifagHvxhyo/qEGCJiX2LwsB8/HzjoSHhpJVG/PDG1rl8iLdjHF59pdW+gt
         xAzcUTJ0hJxBsNipVKbE2ipoWsgpEqBwfodhwJoI7v+tKhZBh0gsxu0oCrCK2EK62W8T
         INzg==
X-Forwarded-Encrypted: i=1; AJvYcCX+NydtVM06utAZlQJkQbU0xtPVoiZ+TFNKrT1dwnqTJXN1GyOnu/8M39C+IA6CymNFp5AeHa8gWPxSbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoddW2sdPbt9oWFxZ289gL91e68KvKBqaKPEfFam4IvqLhl/tC
	dzWEJK6VnHw+MTYiwR4NrT2BkCO1wSoj5Pm4nz0CRkhVMC+2oUMPb7gZ
X-Gm-Gg: AZuq6aKkEw806a2QOP7Ajt5JmJCYDxNu+IWCfLRPxJIkyfnZjW4Z3l/Ee8xhSbZhCbw
	jUSBLAAEiznAUAhD5MuyflUc5iupueZNPqUkSfZl+Z4RTegtflbv6WfaVLMQY0r96214PGGLQuN
	mSXWC8YdPkUoFiG3nSydEaw+6KyOy5WBUAYQacY/VypPPo65hpobC+c3la8YsACwyf5xHb3xx9V
	MAwfKC42loQX4C2Hbutk/E/OpUt3wLGOqfj/HuHDKMbcXDtkMDNPK4yb8vX3/YhQDROZB02PGs9
	lazgIbk0dksYX0sjmj/AJ2t206io4TyvIfVXICKIaQOkwugs/McMDz2ievlxYk7/YnJnVUD9b8S
	8TNvfM9zo2raJTbbyddjkiHa0DU5Z2JFG2ny/N/llXZ1F0F01sDvUQZ/StmcsZ7bIIte2tn1Z6G
	15+9Z0WyObRDhShDCZyBNYN2XoyCKCDyqvKAvwjEVeR+M/4n4BoHgM
X-Received: by 2002:a5d:6506:0:b0:435:9d70:f2a2 with SMTP id ffacd0b85a97d-4359d70fb9cmr3236513f8f.25.1769007325521;
        Wed, 21 Jan 2026 06:55:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921da2sm37281512f8f.1.2026.01.21.06.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:55:25 -0800 (PST)
Date: Wed, 21 Jan 2026 14:55:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dakr@kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Gui-Dong Han <hanguidong02@gmail.com>
Subject: Re: [PATCH] driver core: faux: stop using static struct device
Message-ID: <20260121145524.2ecd29eb@pumpkin>
In-Reply-To: <2026012145-lapping-countless-ef81@gregkh>
References: <2026012145-lapping-countless-ef81@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 11:29:45 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> faux_bus_root should not have been a static struct device, but rather a
> dynamically created structure so that lockdep and other testing tools do
> not trip over it (as well as being the right thing overall to do.)  Fix
> this up by making it properly dynamic.
> 
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/base/faux.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> index 21dd02124231..23d725817232 100644
> --- a/drivers/base/faux.c
> +++ b/drivers/base/faux.c
> @@ -29,9 +29,7 @@ struct faux_object {
>  };
>  #define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
>  
> -static struct device faux_bus_root = {
> -	.init_name	= "faux",
> -};
> +static struct device *faux_bus_root;
>  
>  static int faux_match(struct device *dev, const struct device_driver *drv)
>  {
> @@ -152,7 +150,7 @@ struct faux_device *faux_device_create_with_groups(const char *name,
>  	if (parent)
>  		dev->parent = parent;
>  	else
> -		dev->parent = &faux_bus_root;
> +		dev->parent = faux_bus_root;
>  	dev->bus = &faux_bus_type;
>  	dev_set_name(dev, "%s", name);
>  	device_set_pm_not_required(dev);
> @@ -236,9 +234,15 @@ int __init faux_bus_init(void)
>  {
>  	int ret;

Should there be:
	if (faux_bus_root)
		return -EBUSY;
here?
While I guess there shouldn't be two of these, better be safe.

	David

>  
> -	ret = device_register(&faux_bus_root);
> +	faux_bus_root = kzalloc(sizeof(*faux_bus_root), GFP_KERNEL);
> +	if (!faux_bus_root)
> +		return -ENOMEM;
> +
> +	dev_set_name(faux_bus_root, "faux");
> +
> +	ret = device_register(faux_bus_root);
>  	if (ret) {
> -		put_device(&faux_bus_root);
> +		put_device(faux_bus_root);
>  		return ret;
>  	}
>  
> @@ -256,6 +260,6 @@ int __init faux_bus_init(void)
>  	bus_unregister(&faux_bus_type);
>  
>  error_bus:
> -	device_unregister(&faux_bus_root);
> +	device_unregister(faux_bus_root);
>  	return ret;
>  }

