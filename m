Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDD41DE0D
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751203; cv=none; b=H7+Z/qoiWij92nL8V0lZ9bsmhpcYmtxtZFxOT3eI3hsTJVsXl51E/1jhwjspFvYCuxJgLGkRy7oKjRA6P1fZkx2gse7yh617qezGDm6Pb/RTHSLxGox7T4TFjO96/jSNp0IeBPEGF0w3uQI2CvjtWkg2lhO2LW7kJJVR5j1RmjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751203; c=relaxed/simple;
	bh=skh1J20miHyQI+YX6SjrUI0pPMNxBurFeVoXPbNyAqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMdFz/pXcX/hcrgg6XlFHm7KxlIqMqAwx7jsjeP61caW30eTMdxFY5c64tE4H8kW4nqMZYIruJCcLJlFJG7Um7OQw/ALlhVZQ0eMqvSDEFdqOgkdoOk+F/wR0rlWk0q28Xl6HuuvL2jWMAXsndJi1EZ4UlcXElvHX7S9MES1y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9CJi3xy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9CJi3xy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so661637f8f.1
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751200; x=1788356000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDeYb04JA1wKUlB+4fT7hBu1dYeSHzQSzUnUA5UoiTk=;
        b=m9CJi3xyXsjoSGkFpuBGOOdBqQq61mXZhHI9jHhPtunaoFeunJqOfF0RP+aIOdD+7l
         gISyNg1O5yYR9nGdtg2OJdVll2Yois3AtT6KKZYQcW+tvWmLn79wO2WOSlzvuDAZtS6E
         DqcR+tZ7lpQw8JOD617y3AkUJZN4dfzHaP0Hm48gLKfp08o+wslbzdNDM5XJwrCrJOpV
         Z91wZa+xrQWHvKLoQkeRUD9XnW4rehLxh/+A+ANdY/i9bRmVNzZ6IhziPAIRn3MPCKne
         obqRH1oBk2VwBr/DVVji3L4lhcGglgREuzTF6GK6MPNyAXy4/bLSoh9ANnLTT9Zrr2g4
         +LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751200; x=1788356000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDeYb04JA1wKUlB+4fT7hBu1dYeSHzQSzUnUA5UoiTk=;
        b=SWHkIfbsDkyfFJwItmbML1pMjl3GDT5SHgijVCJAfrawI0eY9buCM+ZimYEGD5h8Vb
         PR/iuimuWKhqKPar2qHRMOMV3YhemPTmkMyryWi5GB4FkCdVG9rPubBgmEc26yEgfKDp
         dxSgNxNZpLPnkqBcyrx/mdwfpVNHv4hpxxGiij+QqGZVwXbCAtFVQ7wzKyR7AjJs8CrK
         P7/a0JfQKNVzzk9nVBQN2XsbiMnc+eSES++X1hQGU3P1PbiVePdDiWKH0/kHE+5Q9dRv
         k3ZtyQ5GEhxMvsmwfensrPBjU7lGEqjebGj7LygY2br8l/lxMHhtwYKIBrU5kmdX2bt4
         j/PA==
X-Forwarded-Encrypted: i=1; AHgh+RrijXneLoL/7KPCp/HembDq6nZoGHIFVAK4W3UvHuecfRCigT/0CK1SvYjuEoWgG6PADAd6E5YRtUk3pA==@lists.linux.dev
X-Gm-Message-State: AFuF++kAQnpQCZ+50h6Jtl3LsCaR750aTGkI/CVxv2AoqaAZ4lIEaYu8
	ZC0RJx/4lwz8x5Vc4aXtPMMV0qLUNUyCSHgpHs1JmfteO9gVx5cF0BtR
X-Gm-Gg: AR+sD100SsoHKRjBVTnbOaprcJ6/2XjjIKkqausLaPR4GoBcknvvcbUJx3vB20dUkdh
	pybhJ9fpBU5edWmDQXeiy5TVlLjfubDLezm2R6VoJIJ4SZNpOpaU9v/Th+OiYxOqApR9PCcJDm3
	G7S0GCDHW1J+C11vQwXE8wS7lfzggrvUkl0c0zn9OOg+YmfoRKUMqwTiMmm4WV9y3VKgSydT3wO
	9UWKjpzaf0uyb526O6+giY1Tf03MEo15Q7PQL6aFgNh6PgK0QKihwBHrAblF/3xd0j+H+ehY9bv
	gOQ9snTIqr59NzkAXtmLIBka7kVtVq0xm4aWqqCNV6WYN6euUH8HxIRk9ZvU57YF00XiaeVETre
	V8zNqibUl5GtTzaX5MBXmwBMzFH/58Iec6QyU2Sa3GkLGDZDkirX5t2GwGxqVdtxzxHJ3UtI8po
	RPEqbx08UtgipIqXY2nsHJxSJIrXku1IxVQyRxOCnx6c24jslO/kzqolTAOIqYH+ktQUM=
X-Received: by 2002:a05:6000:29d2:b0:482:dfaa:dfa9 with SMTP id ffacd0b85a97d-482e26b3278mr4456632f8f.7.1787751199354;
        Wed, 26 Aug 2026 06:33:19 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2777848f8f.34.2026.08.26.06.33.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 06:33:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:33:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826153311.6340efcd.michal.pecio@gmail.com>
In-Reply-To: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 11:19:31 +0200, Greg Kroah-Hartman wrote:
> The ability to add and remove devices from a driver through the sysfs
> "bind" and "unbind" files was created all those decades ago as a way
> that kernel developers can iterate faster, and provide a debugging way
> for users to attempt to add a new device to a driver without having to
> rebuild their kernel.
> 
> This api over the years has been abused and recently come under a major
> fuzzing "attack" through tools like syzbot which decided that it would
> attempt to just randomly bind any driver to any type of device, causing
> loads of unneeded errors and pointless kernel patches to be generated by
> unsuspecting new developers.

Hi Greg,

I think you confused 'bind' / 'unbind' with the likes of 'new_id' and
'driver_override'. Try binding xhci_hcd to NVMe, you won't get far.

FYI, besides being footguns, the latter are apparently used to assign
any random PCI device to some VM drivers for passthrough or whatnot.

The former hardly are footguns and have further common uses, such as
removing kernel drivers to make VM / USBFS work or "turn it off and on
again" when a driver doesn't implement recovery. I've seen a published
script which does this automatically when xhci goes belly up...


I am also not convinced that fuzzing 'unbind' alone is a bad thing.
How is that different from 'rmmod' or pulling out a USB-C plug, which
may have a bunch of USB *and* PCI devices behind it, mid-operation?

Regards,
Michal
