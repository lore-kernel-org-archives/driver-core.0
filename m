Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF322A1D4
	for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022476; cv=none; b=h992FdsNIM000qlnw9s7C31/iRTI2TJ57x0cOm8zOsmQXmDVtJZwBZN3nqZBsXDes113h/gNItCJSTf6VJ7C6ZEiDbEZlVjAkS54vKdusHcXUXj959oihw7tgbdPmrCpxZyD3wVn57A95uIOsi2eJ/54bTwnMjy6x8sK7l1LQls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022476; c=relaxed/simple;
	bh=VvDq6lbA0+MBNpru3nhz56fcZsBSYOu1Jq1hxe+kZqk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HfnMgkQEJtaAFH7pCD/xvtTSRs1MO9a9TBIHDCIzPpXWTo+qG1XjPmmeZo+MrTWkgnvUDMP77mRIRYjJRfqjpOdL81z/wE7E2lBD3ew/ZW9ycg7OBsC8uRuDjRYcTeQ6Ms0k5bFhQcrE48qYtBtpWy7SJ+Hjts9Q7ifAMxFKwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n87vc7Ps; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n87vc7Ps"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c0e264d802so41199795eec.0
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022474; x=1774627274; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mMm4wBnmSeubt2uXZ01V3PsbZvesaIurFwFXvpVAv2s=;
        b=n87vc7PsZNQ0xJ1QKTWPfNEsALGRN5+1/+Pa6P9nJwlUhcSkWzj7riDRn4rkDZuInn
         h9HV1JbF3EmbZ2kLWN7mknAe3KEWXelcr/TUxKZw+5sCsGjb0KknKiulvrwlzTh602As
         gyq7LyhSaoomsNXfqNUlcKNzCKJ0ojqZtmI9xkqCGbQqChDCnXvZRalKY2Y4yK1+HvIz
         wtrIt++AWgeUnbm3y7WnVBqCcuCw8t9q1L6L9GwaA1TbnSOX3O7fq6MvlPJOmayhTvvj
         PAt4vLWc7f0BN3KR2uvfrEm0oZrjB9SxN3+08hRQ7Y38NpmiMPJzynYtiQ4e0pRZHCgC
         Ac7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022474; x=1774627274;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMm4wBnmSeubt2uXZ01V3PsbZvesaIurFwFXvpVAv2s=;
        b=mChnFM0czMXZTzwNQ4hN4TYWzJlwp9uAARRDlWXKwo07jdWbjZyoZ0Oy7OibmFy+AS
         KoNkC1xUdU9hII1ez+NWkdbDEaFXcEgiazY7VXc1pqN6xejEQvzqSyWiT6VUy+rm7M1Y
         fSClmYGOsRQ6P8xI728NpRSWaFOgVnVGqqAjFq6V1aginRiLyPKjlhp0S65crqok5T9R
         7sv95EgjOAuymMuyqsmhlzl1yzL1E1/ot0vPfnQBgYJwUb/hcnS5no3EQ4zl8AwDkcfO
         aUR2eUoahM4uM5pIkDBlZKEOasaH+vaTlv+HLdjPlIScJXF90J7CK7F+0MFb5bESh+Fq
         5nsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+erHGby5DOWwn71jMUyDwjqyjCuhmlguV1/PSdmiyQ3RX1+GCCql+JVEkiimJ9WyHdOGuEIGMVeoTaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxigvzb0xUitYCsvpGBwhTWgv5MTT2WSG9eq5nQ2QLl8gHLL5Ff
	bvCr5X1nLAg2vTsnA16sDp689ibxGHKHPFp4qfGy0JyIVVvEgOXbsr+jAlpY/pRlARVfQCu3bUf
	L620pm5uwzY7ysg==
X-Received: from dybia20.prod.google.com ([2002:a05:7301:314:b0:2c0:f494:8a43])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:9f0c:b0:2b8:4c95:365d with SMTP id 5a478bee46e88-2c1095f54afmr1848097eec.10.1774022473627;
 Fri, 20 Mar 2026 09:01:13 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:00:52 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320160055.4114055-1-wusamuel@google.com>
Subject: [PATCH v1 0/2] *** Support BPF traversal of wakeup sources ***
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: andrii@kernel.org, memxor@gmail.com, bpf@vger.kernel.org, 
	Samuel Wu <wusamuel@google.com>, kernel-team@android.com, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patchset adds requisite kfuncs for BPF programs to safely traverse
wakeup_sources, and puts a config flag around the sysfs interface.

Currently, a traversal of wakeup sources require going through
/sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
wakeup source also having multiple attributes. debugfs is unstable and
insecure.

Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
traverse the wakeup sources list. The head address of wakeup_sources can
safely be resolved through BPF helper functions or variable attributes.

On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
speedup (sampled 75 times in table below). For a device under load, the
speedup is greater.
+-------+----+----------+----------+
|       | n  | AVG (ms) | STD (ms) |
+-------+----+----------+----------+
| sysfs | 75 | 44.9     | 12.6     |
+-------+----+----------+----------+
| BPF   | 75 | 1.3      | 0.7      |
+-------+----+----------+----------+

On the memory side, between kernfs, dentry, and kmalloc, each wakeup source
removed from sysfs saves at least 10kB.

The initial attempts for BPF traversal of wakeup_sources was with BPF
iterators [1]. However, BPF already allows for traversing of a simple list
with bpf_for(), and this current patchset has the added benefit of being
~2-3x more performant than BPF iterators.

[1]: https://lore.kernel.org/all/20260225210820.177674-1-wusamuel@google.com/

Samuel Wu (2):
  PM: wakeup: Add kfuncs to lock/unlock wakeup_sources
  PM: Add config flag to gate sysfs wakeup_sources

 drivers/base/power/Makefile |  3 +-
 drivers/base/power/power.h  | 14 +++++++++
 drivers/base/power/wakeup.c | 63 +++++++++++++++++++++++++++++++++++--
 kernel/power/Kconfig        | 13 ++++++++
 4 files changed, 90 insertions(+), 3 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog

