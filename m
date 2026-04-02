Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75733F5B3
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775162621; cv=none; b=tLaLol0iZDInil6IY9ZCFF6PRSmSULbN+bLqpoDuXXjc+QJNfzkunWp2SVSmBEoXE7Aymg+B1+hbwbFAfGXvKqMxObQ91sYZD1UlXL5UdqPrENHIKLII3IbzpBFXFEJF0xJY9+dDbymYFSzBaLUYhPN5N+Vt4Sa5uYjBa2QNL1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775162621; c=relaxed/simple;
	bh=PfOSvF+9Q9GvIApbJuER9HJI0ph9y/C4dHyB4wNs/UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwIimsbpm3Zbydm7jNkn9QKeMVsWNCd0eS7z4zvNC+PIPw8jqGBcm5GHU/qZwQ+TK4mdDSDL10DPT3iKZyO+ACEgkyf2UN1aG8l/3jWPmiDnX77V4vNY6oBUVF+blS1eqLR3Pt6nAp7UWtjKFw0K5OdFJOhd2H4oMIB3MmHMhoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPQ1Ppgp; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPQ1Ppgp"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c54c68db4dso2433801eec.0
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775162620; x=1775767420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21ClTGnhigH6pmJ1bdxGPTsm+cYy8Gt+rk4//h1qZck=;
        b=XPQ1Ppgpgk27a3/gJwjseJdLdbACej0OTsbtcKJT1AtAvqrO7wYQFM0a9IePTZN29E
         A3k/EjVhYO+tbW3WTdbfF4Q8e7Zu45s6gcIfSbbTlyMAtncYhxpuL0h+tA4aJdO0PeD6
         oOW/91PwY9rH97NqvrpBIboQHGYaxXnAA2Bjd/MoKcGLqlDZCo3RopMmUsFDsaBmXyJm
         YLGxKOHxXkyd7/A8+KYmkzEhpinqHrLnkiyOUTv246NLLYa00WViB9kDJ1gDq5fEEc7B
         Q3STd2oM5MnARc58pUyIaqW1oc1sZRnHuWJykloW0Bt+kkYNkOWbgLo08Cr63z1qGRrQ
         jw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775162620; x=1775767420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21ClTGnhigH6pmJ1bdxGPTsm+cYy8Gt+rk4//h1qZck=;
        b=lcwxhDqo/lsjC/NTq9Kosv1ZxVXAapC6fe+MyrmYToFYxCOpuT62AL3/knn6ZYcCNZ
         3SeKxmszz2X3ChNyhNhqOD2DA/Fz19oaDARIyeUuPmgWr2+p7u+kYTBsfZekVFcGQ3zC
         3Gh98D5oJX1moLWrSO/fPLcIVs/YmGuQpcSw3w3wspOVg0C18XodnmTtPoQwkZCY+AN+
         OVkZnmUw2e9zq0T63ocKgQhhZhJ1zhoKb0X7oDzO05LD4onSm0Ur7EsX1g+pv96AKNcm
         WX9ZvRL41ZWAxJuPCtFuf0LgOJdQO+lpcO0d7KD0e5TnD+1g5dVLoDVlh5Gijbwv/5YY
         npJg==
X-Forwarded-Encrypted: i=1; AJvYcCVzE5F9ZtVGWKuqknNYugbL+QDmPVG5v9pvT93Y4VKSyWy9l+JrreGMuU08HZ8zW7fOpRSHZKBiF0JVbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7bJW9bXRxdz/jp8GAq+eoURJnzZ+k4OMQjztJsmSl0pMcxlmv
	RKUpk+bFX7/1RzQCe4WQP6t+I04FSgwdp0Zh3iDh7Nh5fGlFMyWNVhx+
X-Gm-Gg: AeBDiev2RO46OEoy1ms5jFr5s5TXhJtIjzCYpKRw0M53dHt8coRlWXbh+/QNam/6iKs
	VDOfOVJa4fBwkAbVPqN5Fd7CzsY4lroS7UFTO7xPkZolLy6O2ooej/xsYjerbjGfrhTw8wz5GOw
	KxlwygJjD77uEo4jCNbr6/kX2uLoRKty0EVyPO72g3oFgrsReOKbhh2bZhBSOI6XQrR7XyYiaUe
	oJ1KjaF/wev2jFU6Sla5VmfZPvUV8VIo1qFY2i9CpigDlud3WFcQhY9Tvti9E3tlRnGKwIDO2ij
	G3QMHYFrqrFwhLOtkO8u+RKvbvMMICeAgYIzFzSD/HPuEStailY6IV3CLmTMBux9DRP4Wa8wLas
	9XUmDAntYgLMZYCOn8U+IL9bP3Vont0YHf7ngwJrhqm9i2+3b/Ite+fLpbLahKL46/PMQ28UYKS
	1slZXzS5ZDODkRJ0VNw0X1exjzvLQoHrSbHTZlkVgVj5sQjpVk8UDg5wphRLzvmuqJ
X-Received: by 2002:a05:7301:1e87:b0:2c6:cdb3:bd8d with SMTP id 5a478bee46e88-2cbf9afd61emr347222eec.7.1775162619471;
        Thu, 02 Apr 2026 13:43:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b195sm3280897eec.16.2026.04.02.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 13:43:38 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:43:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <ac7UqTsPC8yUooAR@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac5wprh9vfTU5pGa@ashevche-desk.local>

On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> > It's possible that at the time of resolving a reference to a remote
> > software node, the node we know exists is not yet registered as a full
> > firmware node. We currently return -ENOENT in this case but the same
> > error code is also returned in some other cases, like the reference
> > property with given name not existing in the property list of the local
> > software node.
> > 
> > It makes sense to let users know that we're dealing with an unregistered
> > software node so that they can defer probe - the situation is somewhat
> > similar to there existing a firmware node to which no device is bound
> > yet - which is valid grounds for probe deferral. To that end: use -ENXIO
> > which stands for "No such device or address".
> 
> This error code is also too generic to my taste. What about alternative(s)?
> EADDRNOTAVAIL
> ENOTCONN
> 
> (The brief grep shows that the second one might suit slightly better than the
>  first one by existing use cases.)

We are in the core of the driver core. Why not simply use -EPROBE_DEFER
to which all users will resolve this error to and call it a day?

Thanks.

-- 
Dmitry
