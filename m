Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE99A47B422
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095244; cv=none; b=R1SPGKFBhlGUHjHb6TwChd4MKHJU+bkvm6E/ZzpGvVzcrc2A/SWopOjxYuT+Krwc0zqRnjl5f3H6oq2v2DkcYQx9+xlx+GXgq62/8qz+OBoXEZlRuglspFGa69SXF0+ObstSEtK7I/6gntRU7pOrh3AQyeG4sjj2dwXoKzWCiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095244; c=relaxed/simple;
	bh=SnbfDLY4tTJqB1v8LhA/WdScgHkhh06wd2LjFSIubrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKEZ2cjdnVpGp5H83yFSP138Cs94AM4DuPglz6xM5W3OXtAQ7cX2j50wz1DSyj7zTXhiZSckF43MvG9U8Yw4ykpKfP4G6ws4p8Wv5SEGAvYYK8Xt6ew9IgUlYQoi7/paxo9ot2kekFWWrG2F7GPwmC0QCMckJIArqgxu1f7iSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=heqTmse4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="heqTmse4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792095241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYRSFyiULvh6szKRePAOtHKD+7/o0oF90IjOubYIGB4=;
	b=heqTmse4IcYcxajpUHFO5NfmHq45vspk7SJEh7yI5uWAQF/Q7MV1MGN/4EYI4t5lyQXOAw
	8hLacwH5qhmwIBBpy2po31mZgoSB366sQomyd0JdUYRle6wgmhoL3Vaa8QFdBCZxIdfgaT
	RQWUpHh1uoo3+F2GpJDj/xhcPYM7k5k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-600-IdpI9AU0N62UZVqT0kj7fQ-1; Thu,
 15 Oct 2026 20:13:56 +0000
X-MC-Unique: IdpI9AU0N62UZVqT0kj7fQ-1
X-Mimecast-MFC-AGG-ID: IdpI9AU0N62UZVqT0kj7fQ_1792095234
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9BBB1955F1A;
	Thu, 15 Oct 2026 20:13:53 +0000 (UTC)
Received: from [100.91.18.181] (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D8397C6;
	Thu, 15 Oct 2026 20:13:50 +0000 (UTC)
Message-ID: <f12ad8ee-4cad-4c7e-a0c9-c22fe894f14c@redhat.com>
Date: Thu, 15 Oct 2026 16:13:49 -0400
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] tick/nohz: Add runtime control of non-idle tick
 suppression
To: Peng Wang <peng_wang@linux.alibaba.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 He Rongguang <herongguang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, cgroups@vger.kernel.org
References: <cover.1792067271.git.peng_wang@linux.alibaba.com>
 <8d10bb84-d312-4be0-8c43-ddd602850a1d@redhat.com>
 <atER8P0ws6Gg4GWE@MacBook-Pro.local>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <atER8P0ws6Gg4GWE@MacBook-Pro.local>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: XqquAssJVTDBYxU5A7H3WuwL52PhiCMzNRbcg8rddoU_1792095234
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 1:48 PM, Peng Wang wrote:
> On Thu, Oct 15, 2026 at 12:00:25PM -0400, Waiman Long wrote:
>> On 10/15/26 8:43 AM, Peng Wang wrote:
>>> Workloads and their need for periodic ticks can change after boot.
>>> This series lets userspace choose at runtime which CPUs in the boot-time
>>> nohz_full set retain the non-idle scheduler tick and which are permitted
>>> to stop it, while preserving the existing isolation configuration.
>>>
>>> The first patch adds a per-CPU tick dependency; the second exposes a
>>> sysfs CPU list. Permission defaults to all nohz_full CPUs. Revocation
>>> uses the existing asynchronous kick. Idle tick suppression is unchanged,
>>> and policy persists across hotplug.
>> So you are basically setting up more nohz_full CPUs than the system actually
>> needs to use at the moment and so want to disable nohz/tick part of
>> nohz_full CPUs that don't need it. Can you elaborate more about the problems
>> solve by introducing this new behavior?
> Hi Waiman,
>
> Yes. We have CPU-pinned workloads that benefit from reduced periodic
> tick interference. The desired tick policy changes with CPU allocation.
>
> With spare capacity, we allow selected nohz_full CPUs to stop their
> tick. When capacity is fully allocated, we prefer to retain the
> non-idle periodic tick across CPUs, avoiding an additional difference
> in tick interference between housekeeping and nohz_full CPUs.
What problem does that cause?
> A CPU may still have only one runnable task in either case, so the
> existing tick dependencies do not express this policy.
>
> This series keeps the boot-time nohz_full CPU set, context tracking,
> RCU offloading and housekeeping configuration unchanged. It only
> controls whether those CPUs may stop their non-idle tick. The policy
> can be changed without taking CPUs offline.

So the policy is to make the tick keeps running when there is only one 
running task. Right? I am just not clear about the advantage of doing 
that. Is there a use case that will require this particular feature? I 
doubt this will get accepted unless there is a compelling reason to show 
why we will want to have this feature.

Cheers,
Longman

