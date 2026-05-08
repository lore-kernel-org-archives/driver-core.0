Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25F1862A
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264774; cv=none; b=XXBYoBlUUILsV4hnxSIAGkqDJlgA3c+HbLG10OB2M9FTDCOOSieIicWNfI0935p2VUnRbC5vZOJaRhLosoN6KyzU+LXLpG23uj9Pcq9RQLOELn62uKVd+OSWrs1n3e6Crl4cZeFwWr/GTZqBq5LbDd66dgJrcEd5sCeuG7T0CKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264774; c=relaxed/simple;
	bh=gPt2p5mRydIx09aB5eoi5h+EjR87ILB07pmtiyqKD6c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECR7b9wx7NHSI0WUtWJy8mx7fWaiWaW3J9/P6BN/cmiCIWweOBxqj8wKe+nMT7lZvFLHIcVoCLJrfW/S732lyt3BqakYSx4bpFWuwE147gEXYMOQALl+9Bcpy5ANBjh8vcq1iZgRolveKidnnZ/YHtuPw9Z44Ir2NVKBJ508StI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDacNlXs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDacNlXs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45562c41ec7so165644f8f.1
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778264770; x=1778869570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nadJ4F3fO0o2IbMhIzDipftu6czfRb7SQ9fGD7WtGtQ=;
        b=aDacNlXs4QwNSnrFhYBknhe5X3ZNuTEi/adJel56gS73CAmFYWl9vnKxVsvYyzVRHR
         8+o+TI9dHBkDZY57p87lgtLztBiw1Orvt8W4C3iKgb3bVzxii+/UWXPRIymnuzzfEhyk
         AdpuVCsdaWFgT4Iyz8qWTryiFFKVln/CqYWlffFi6gfqWSu4njJNXAfObUVNQecO1EF5
         QK5qGuJrSOsasIs1zCSDWi8MXQOworcBl30cLaOZ9Hn81utkd/GTGgu3o5Op+qBVNte6
         QH0AUHTMftxs2zQQ0BOBQhcwvZ7kUzh0wZJQ4K1I6iZ6TQ+TuXOkabTEmp624iyzhzOC
         AU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778264770; x=1778869570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nadJ4F3fO0o2IbMhIzDipftu6czfRb7SQ9fGD7WtGtQ=;
        b=juq7OG6IbI0cN6GcZd8F8oCIWQBDTOsDUXudWSytSIG1PMIIhMBFsrZDU36TM5MEFb
         JbWcqp5t35sLQWBFF//txSHP6DeWYB+7ek5CFZgrvrnytSBKx9Xz5pG7DczVfh+HIOPa
         d1dD2vbcLoferuHi75xFrph47j65FpLTZnyWlHdK0CobN4D2iU0VkcElwu6QWzPxmfer
         BNGgufs2B3XcE3F1hjDKMmyX/PyJHdaOzB0BTYkOU8SMm/Zk8K8VTJ4OFKFT+5ZU5vUi
         xDkyLqdcScuHfk/G5WGKhwuY6+v4NYAfXoJI5gvGOHpwB30raFuqyRZW5D4bPsHnWhlu
         f89g==
X-Forwarded-Encrypted: i=1; AFNElJ8s9dwRCmw9Mw7vbqz99uqyr2Q1mpbCAGkX7nesBpCP2ZyeZIAG8p9AdHX0YEUK7dS1sba+dV+hfvExQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPkR3/YW1q3HzRwIachTUMlRFeAZD6trYiY/iIzk8ssvWotRv4
	E1JXVlTq5I1dTkMbdX0lo+dxyVsFgWnwDX1P8Z9NHqggJCfWGCycwXmR
X-Gm-Gg: Acq92OFxcd0B1uQQEYP4jvb++swnNqkICt2U3rghX3+1zf5O6rErbgEEFyASRsJ8KPh
	lHeksUk0N2PSA8FjkC0Y4rmu2NTNXkE9sKIkYoGCC83mheaHPcgUFFvJzZaH1wwL74rRTwwj7hY
	vsyjGX4ZBLMYauRv09tqmk6N72zkmngK8j7Z/VPVkAMP/RxoKC7kVG3oYgihJZpoGM1QlPL13Gb
	JFDO5iorY9Os4Obj8mHs98gB+E/O00z56gBC6ddneMZ8pVFKisYowMZGiviYo4Dx6msjkacL1Nt
	FbMnCBOKxCPr4/LV1xpSDlyhMXjhypEtpdf8q8iwWV0NvL3ts3e6Vmv2SU6TR9uanBL8Rc/g3eL
	eVzu5joQVIaWILsRIeVQclrwcyau22Ec3SS+53/5olirUCOsYIaoX4SUWKCkFskqX3jFVdLsek5
	p78xYVAkD/yBWQH7f64EQhsTaV/vEfuHL1bB2yuELYLDAoaX+VFG5DDomatcm3Wwax
X-Received: by 2002:a05:6000:420c:b0:43d:7508:c9c9 with SMTP id ffacd0b85a97d-4515c5752d8mr22366137f8f.27.1778264770073;
        Fri, 08 May 2026 11:26:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c79fsm6435208f8f.15.2026.05.08.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:26:09 -0700 (PDT)
Date: Fri, 8 May 2026 19:26:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:READ-COPY UPDATE (RCU)" <rcu@vger.kernel.org>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRIVER CORE, KOBJECTS, DEBUGFS
 AND SYSFS" <driver-core@lists.linux.dev>, "open list:FILESYSTEMS [NETFS
 LIBRARY]" <netfs@lists.linux.dev>, "open list:FILESYSTEMS [NETFS LIBRARY]"
 <linux-fsdevel@vger.kernel.org>, "open list:TRACING"
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] docs: fix repeated word 'that' across documentation
Message-ID: <20260508192606.2423f50e@pumpkin>
In-Reply-To: <1501caea-8cff-4968-aca6-e8d4b20e0e80@linuxfoundation.org>
References: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
	<1501caea-8cff-4968-aca6-e8d4b20e0e80@linuxfoundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 May 2026 11:15:28 -0600
Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 5/8/26 10:37, Adrien Reynard wrote:
> 
> Missing commit log in all your patches - I don't patch 1/5 in
> my Inbox.
> 
> > Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> > ---
> >   Documentation/RCU/rcu.rst                          | 2 +-
> >   Documentation/driver-api/driver-model/overview.rst | 2 +-
> >   Documentation/filesystems/netfs_library.rst        | 2 +-
> >   Documentation/trace/histogram-design.rst           | 2 +-
> >   Documentation/trace/histogram.rst                  | 2 +-
> >   5 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/RCU/rcu.rst b/Documentation/RCU/rcu.rst
> > index bf6617b330a7..320ad3292b75 100644
> > --- a/Documentation/RCU/rcu.rst
> > +++ b/Documentation/RCU/rcu.rst
> > @@ -32,7 +32,7 @@ Frequently Asked Questions
> >     Just as with spinlocks, RCU readers are not permitted to
> >     block, switch to user-mode execution, or enter the idle loop.
> >     Therefore, as soon as a CPU is seen passing through any of these
> > -  three states, we know that that CPU has exited any previous RCU
> > +  three states, we know that CPU has exited any previous RCU  
> 
> The original intent might have been to say, "that cpu", so adding
> the missing comma after the first "that" or change "that" to "the"
> would make sense.
...

I don't think adding a comma would be correct.
The clause splits as 'we know that' 'that CPU' and the repeated 'that'
is absolutely correct.
Maybe 'that CPU' could be replaced by 'it'; but it can be difficult to
work out what back references like 'it' refer to.

You can re-order it, as (say):
	Therefore we know that as soon as a CPU is seen passing through any of these
	three states it has exited any previous RCU read-side critical sections.

But just because some grammar book says you shouldn't have repeated words
doesn't mean there aren't exceptions.

The sign writer was doing a new sign for the 'Pig and Whistle'.
Unfortunately the gaps between Pig and and and and and Whistle
ended up visibly different.

-- David


