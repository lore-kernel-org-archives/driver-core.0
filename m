Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380333986D
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869228; cv=none; b=K1L1se0vX5C2CkOPDW1Tkh/G9svGSGQvSD1ixzoPMcZpX40/xVLNLVNxHq2Qb1emZJsNrPT69NvKRWGTmKJrQ0dkLeN2zFVib9p5m4EyBiV97s25NdDOwwg3ckmmDg1jtasTQyWgJJnib0sjTszKNIkIhCnnFyCdveEPt2S4YhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869228; c=relaxed/simple;
	bh=dD5OihsWQ7cuMdc/Bwdk5AKbu7MUQ+Q2mqg0J477YFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTW7fJjST3Wo0NG5p3en3es0Reb8Vv20edyHRlOFi95ynpkrEmgbcCz4NORMtkT7kNYoFspOS7qpAClUhqHnhYo3M5AVZODVmrmUhzTw4stEMDUUZB/5G9eKiH4Z3vG57R9yGgSG3VblYRKZu6wAEYx7ooLA98ZTXhErVSzwlzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga6luArl; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga6luArl"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12721cd256bso5252769c88.1
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 09:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771869224; x=1772474024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McVEYiWQKsUH8yffi2lamClhWSj5cXVz2XtqQUlFdkg=;
        b=Ga6luArlNHeMRSsmPSe91IJ7H20FzRMZKTGc8Pbf4Vq4QdcbgGhd/KVdX0BCi3PZ6G
         vA70iV/RZGVu/IEfXb7eB3W1HhVCQlX1zHqVcMtBMDlRsIFh6NHpL6ys1oIDgOWO9ZdN
         a0VeY2zfDCkO2w0YlkIrrUB77lgTxdrps8Y2RM6b3ikOIba01/5iLuQVxTjREx/tnbmC
         +Q8OaWntl01TjjKyXyTB0EZcoR6WtAhXnGCYMYHiTC6ZrBZQhuADHgdjWXgWjR3Wj4Fd
         4lOwILBcjQ9fdnivGW+cVNU5xY4NKj1wGrItslMzN+fPbmKsuT7p8A5wSk2CJW1+o9T7
         +PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771869224; x=1772474024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McVEYiWQKsUH8yffi2lamClhWSj5cXVz2XtqQUlFdkg=;
        b=ACbzcAwaAzzdhVgjhuIN8ukNh8J8zc5Ym9Jtl6+onsBVYYX8oA7I9+arA2RPrCbVbI
         u7OdNv0FwtC5Q8CjIkYjPlbfE7gYI70JUrmjW3nd7vw565gViDteA+3OJ6AySvWbX5yR
         yQcL/Jkev1zzkYlWjZe4poQQDK/FDUmGBtG9hv5LM23n5H/tHSibEpry1DJpJHgovvIi
         fvMzuYTukhoSBc/PzAcFEY1eUXoBer9ierlb2CbXJ6lU84RbyMU8dr/29zSPkY8IV+HQ
         CxsCiaF1HtF02PV/wEu0sYv4QDQewx/afkn49IAT0bXXltDGDflTq3Hf2wGzSk9fH7q7
         FXmg==
X-Forwarded-Encrypted: i=1; AJvYcCWydAvQIPga3MfYOsDvFSNZUODINEfxfMkYeSf0VBysAnZxJn5rbUuYkfLXwVs22M+vIyCHv+YXQ8kOlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySSpCgfBrsbdjawYQsjYzWAAihSLDNnmbiznmGHB4k9qssDkm9
	Js9QmIgZtmx5dtKPEJAMg5Oh0LRTTvPLTMs7Ix8uhrGQbch9da122+MK
X-Gm-Gg: AZuq6aIgjoq5Qd44zkQRkHeiAITagS1BYVNGXJncjmgpCM68YfejZEgbv/kSyoB8ZuV
	tBfWJE9+67iGajzFPJ3QvGMF+du59kM5NEqRWoi383w2ZQZkyOlb7lK6YNPTjxEVaVOL54XlFTw
	gEAx6CzC3PgjTw3plew3qyGBmMCgrW429xV0twaFjyxdf8X8ot66v1swU+x28/JGNu2Ob7uWvH9
	zQbb57mQNldrwaUms4hTvfavg8akWUc4QDmK0d+pKCMrMUofRBIiC21D/XKabMdt+oGTCFR3S2X
	OE+t/dbg7zrTr1HHeFp1r7qBppOnuGqgw5zyPFv4tI9DJxFg1/ly2qfLWLP0PAzoS24SoX05AMG
	O+1SgBYVSGGwotR+BxvAKzEibQHxm2llqNtPg0NMCkpzGXmAKeSROoTQsbhiV/+v+rV+bIMaDgi
	UoVpY1cx0guAo3qXx4RhAh+ov4ixLADfSAGYr4A2xmo6sw0w08v/H0+48B1TqL0le0
X-Received: by 2002:a05:7022:40f:b0:11f:2c9e:87f8 with SMTP id a92af1059eb24-1276ad4317emr4177636c88.34.1771869224454;
        Mon, 23 Feb 2026 09:53:44 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm9029506c88.6.2026.02.23.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:53:44 -0800 (PST)
Date: Mon, 23 Feb 2026 09:53:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] driver core: make fwnode_is_primary() public
Message-ID: <aZyTvZblnyMgDlYp@google.com>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>

Hi Bartosz,

On Mon, Feb 23, 2026 at 04:40:52PM +0100, Bartosz Golaszewski wrote:
> Export fwnode_is_primary() in fwnode.h for use in driver code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/core.c    | 5 -----
>  include/linux/fwnode.h | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f599a1384eec90c104601422b04dc2b4c19d4382..2e551bbe591b09c66b113b419ba63f17e8bea94a 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5122,11 +5122,6 @@ int dev_warn_probe(const struct device *dev, int err, const char *fmt, ...)
>  }
>  EXPORT_SYMBOL_GPL(dev_warn_probe);
>  
> -static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> -{
> -	return fwnode && !IS_ERR(fwnode->secondary);
> -}
> -
>  /**
>   * set_primary_fwnode - Change the primary firmware node of a given device.
>   * @dev: Device to handle.
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index 097be89487bf5c5a96f01d569c1691088db4f0ca..04db7f3ea50cceb9025c82c6449ba342d0e1b4a4 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -230,4 +230,9 @@ void fwnode_links_purge(struct fwnode_handle *fwnode);
>  void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
>  bool fw_devlink_is_strict(void);
>  
> +static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
> +{
> +	return fwnode && !IS_ERR(fwnode->secondary);
> +}

I think this is a bad API to be exported for wider use. It is surprising
that a standalone node is not considered to be a primary. It is also not
great that the argument is not constant pointer.

I would suggest having something like

bool fwnode_has_secondary(const struct fwnode_handle *fwnode);

Thanks.

-- 
Dmitry
