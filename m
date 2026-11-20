Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201152;
	b=h+QUFMqbtVlE7h3GzTNJMe2cjRdbsoziBck/nXxdkiSoqCbUOYehOGK79WvLJS5bySJm
	 dscunZtUYlZ01aBMul5Oo/tZZ7fJO5CUw4gJm6MFHKsRi/BHrnjzNY9w+bMdEuQs8F7X/
	 N6hL0UkCkybpRv42VamwXooH9bXl/WZ1wClMZ00UWUrDkTqW2iJP5fjnGoHxylcb0VKjM
	 VzFhrkqMOn0YB0sejirKi1xXyvlnAM0FNWbFHM8hDpsy2ZyZyuyJ6yASomn51SOt/pqHo
	 v5qWcomTJSaJ21KMC2+YQKtxbc6Rv7n5Ng7CFfcTscwWMP46wNjk+/643tjbnSOFw7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=tJwebgYCqnOwbw+tEDHyKOXYITgvxF1JqBIr3xmLP1k=;
	b=4ZvnpevCkNzF7pn2KZN6yqAqrXBGDnHQclVdyCwxuLoRxizxsuP2+Xcrd/zJIMaAi18/
	 OCRYnXpei1alDMj/zUP2depy7AUym51sHfZXbIFhlnN8+VwiZVJ6bX5ypjum07dhiWKd9
	 IL3fg+IPpiXfvolpWEyjI1kmcYUNy2eXrn5Mp24UWdaXyqQAAyU+jQOjR4ksYe6EyTVx6
	 vMKWw+wSSDffQBI2FLjB52Y19xH4PvQROoojCzZsmYTEJSQ5Ln0zBA1OT6pB0ctnphCar
	 vJoo9XLgt45T+3z698yfZZej0bzFiTUKrTfB8vwm649oE7/nH01qBi6B5dlbqwYKVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RfYrMQQd;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B9460A262A
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 18:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B9460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RfYrMQQd
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-92119da3d37so11655386d6.0
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795201151; x=1795805951; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJwebgYCqnOwbw+tEDHyKOXYITgvxF1JqBIr3xmLP1k=;
        b=RfYrMQQdhh1UYy0T7Q7MoPPy4Yyxtcm/okFvU+xk9HE+fQ4QPkLpIXNaPLp9w8PQwy
         DIqiaymg9VWf2DxItOZcQD2lH/FWhcZfv/I7pBHDSfL9Ca09cNoIUMGHNajNjfGkL+Tz
         b4m16BWXDn9mfoXKw8ODsfPvPpLjSv+0NuxkOKVmb+QuvbmqpOm27wulaf5AZ/wHt+js
         SJZB1lN8YnZ2o+qJ/ZOUMGQfvMbpWpNC3gH+N7rxouN6Q+9qf87WANBpud7TzElvTOoa
         xJQS0WbP+SHr0v2OY4mfFQoatxZuZAVwKy7yQD7lba47kq7QTkNSmPhPgyi7TJMrjOg0
         IEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201151; x=1795805951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tJwebgYCqnOwbw+tEDHyKOXYITgvxF1JqBIr3xmLP1k=;
        b=Ya21szpD2Qx4q8qnfgq4nri0HxH44lOhtNRNA6HU1zK8CnXNsn6hD0BG4DSHKL0ceU
         McNZ/nZrf51i+2kn2d1Hk4JhZbMlOKd6RX8qlE3Ru92Ry6OLZW0dTWkvIiB+Gcd0La+T
         m3w7C79JMOZeGuvPD+hKlkXfEXyscKcTcXhWUwz9jWYcaoPvZM4GfSuqLJUsqoU4xUOn
         YEQH+Jh6NV76RhNnM6GDRIlSBPcx622vTFpjhI05ftGZa7hImizly138U3q49k3zrjul
         z2a9UDgIjBbZpERe/dE2mVsrLFgjMkMw6rZEuWQoE4h8SJyOQ2KQD9DVAgYD5wLZL5bJ
         4bdg==
X-Forwarded-Encrypted: i=1; AL+hErHxuphHOYebl7/sMbhWD5MlQ71wkhYzzrL5Sr56VxD05YNEu1jcyVi++BwG7Frtsaq2zvAJo1sNA6LH4A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/PftNYQotcqJ+zCNqSvQxMu7586cd0L6hStdZkjXh5hHjc+/Uz
	kD+JdlefZacUxHwipqGAV1ZeI2SGO4tIqezJ4vduvFneUL03QxIHcSXSf1MHx3NM5nA=
X-Gm-Gg: AZFdTZdRjfg3ERJcXewB3uynQapzxdAhBAXwQlmqMeLc/QZj1Rk9ay5wgE99F9cRVHL
	9+C6gkqMtOuAIly+RjPf1aW7xwdck5eI41lasWPFyRVVt1zYM0ICuns6FuyZonAfUVrUhSRlkDU
	wCmzVOQmpgkpIrEnHfYf4/jmAxNXnpadTVCTlMFmL4JvtD1LZcOHg679nfFCL4ubDwKotXUU6Wo
	SbHdNIrNYiF+LZhw0nzuoj/mG/pfm1WfM5Uzx3dxtwO4ncrD2JcMjXKqlQzHylgxJDxhmZKShot
	qcRiTag52OD33xmUs9yv/r+4U0OHkWy/5zktjXJhO++u+LLY7RcAEuK9u5zSDshi/Lhh12olCqI
	1XMknpta5GK44JsxEH86s1CwEWpOPTVIejtlJtEhrQFuma0/t5+mdYuXqg72qSVR/wmBsNfaTG5
	/tWnISVgsFw4LYILxY9il1NsmMzfUgNvAyOGcP2XnpFx8LWs6OuXn1JH/8umpcVS42gyVi0rDQy
	5h5jZ7Znf/9Hb0a7rWBD6NO2eePZGdYr9tSvIwSPQex5UzjvTTpeEoHQ63ql45zpkGMyaCQY4H1
	wuQJvw==
X-Received: by 2002:a05:6214:528a:b0:91f:171b:e02b with SMTP id 6a1803df08f44-92134b3fff4mr65009886d6.35.1795201150678;
        Fri, 20 Nov 2026 10:59:10 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm34171876d6.32.2026.11.20.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTpF-00000004mVJ-1MNw;
	Fri, 20 Nov 2026 14:59:09 -0400
Date: Fri, 20 Nov 2026 14:59:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bradley Morgan <bradley.morgan@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>, Masami Hiramatsu <mhiramat@kernel.org>,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] driver core: Disable driver overriding by
 default
Message-ID: <20261120185909.GB1133597@ziepe.ca>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
 <f7b5c6319203d288a166e6f811c6ea07e12d5f4f.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7b5c6319203d288a166e6f811c6ea07e12d5f4f.1795171088.git.u.kleine-koenig@baylibre.com>

On Fri, Nov 20, 2026 at 12:11:02PM +0100, Uwe Kleine-König wrote:

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 8228c9acc530..ed505e362b1d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -424,6 +424,12 @@ Kernel parameters
>  			do not want to use tracing_snapshot_alloc() as it needs
>  			to be done where GFP_KERNEL allocations are allowed.
>  
> +	allow_driver_override
> +			Allow matching drivers without
> +			.support_driver_override = true to devices using
> +			driver_override. This is a dangerous operation in
> +			general allowing root to oops the kernel.
> +

I feel like this is more appropriate as a lockdown level than a kernel
command line?

Jason
